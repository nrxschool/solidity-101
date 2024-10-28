const {
  loadFixture
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { expect, assert } = require("chai");
const { parseEther } = require("ethers");
const hre = require("hardhat");
const { ethers } = require("hardhat");

/*
  loadFixture = configura o estado inicial do blockchain para uma função específica, evitando duplicação e acelerando o processo.
  expect, assert = permite verificar se os resultados atendem às expectativas durante os testes.
  parseEther = converte de ether para wei, a menor unidade de Ether (10^18).
  hre = hardhat runtime environment
  ethers = biblioteca de integração com blockchain
*/


describe("Token", function () {
  async function deployTokenFixture() {
    const [owner, minter, pauser, other, random, admin] =
      await hre.ethers.getSigners();

    const token = await hre.ethers.deployContract("Token", [
      "Token",
      "NWC",
    ]);
    await token.waitForDeployment();

    await token.grantAdmin(admin.address);
    await token.connect(admin).grantMinter(minter.address);
    await token.connect(admin).grantPauser(pauser.address);

    return { token, owner, minter, pauser, other, random, admin };
  }

  describe("Deployment", function () {
    it("Should set the right default admin role", async function () {
      const { token, owner } = await loadFixture(deployTokenFixture);

      const DEFAULT_ADMIN_ROLE = await token.DEFAULT_ADMIN_ROLE();
      expect(
        await token.hasRole(DEFAULT_ADMIN_ROLE, owner.address)
      ).to.equal(true);
    });
  });

  describe("Minting", function () {
    it("Should allow MINTER to mint tokens", async function () {
      const { token, minter, admin } = await loadFixture(
        deployTokenFixture
      );

      // Mint tokens from minter account
      await token
        .connect(minter)
        .mint(minter.address, 1000, "ipfsHashExample");

      // Verify that tokens were minted
      assert.isAbove((await token.balanceOf(minter.address)), 0, "Balance must be greater than 0");
      expect(await token.balanceOf(minter.address)).to.equal(1000);
    });

    it("Should emit Mint event", async function () {
      const { token, minter } = await loadFixture(deployTokenFixture);
    
      await expect(
        token.connect(minter).mint(minter.address, 1000, "ipfsHashExample")
      ).to.emit(token, "Mint").withArgs(minter.address, 1000, "ipfsHashExample");
    });
    

    it("Should not allow non-MINTER to mint tokens", async function () {
      const { token, other } = await loadFixture(deployTokenFixture);

      await expect(
        token.connect(other).mint(other.address, 1000, "ipfsHashExample")
      ).to.be.reverted;
    });

    it("Should not allow mints to happen without IPFS hash included", async function () {
      const { token, minter } = await loadFixture(deployTokenFixture);

      await expect(token.connect(minter).mint(minter.address, 1000)).to.be
        .rejected;
    });

    it("Should make sure that minted tokens are equal to total supply after each mint", async function () {
      const { token, other, minter, admin } = await loadFixture(
        deployTokenFixture
      );

      // Mint tokens
      const mintAmount = ethers.parseEther("1000");
      await token
        .connect(minter)
        .mint(other.address, mintAmount, "ipfsHashExample");

      expect(await token.totalSupply()).to.be.equal(mintAmount);
    });
  });

  describe("Roles", function () {
    it("Should allow only ADMIN to grant MINTER & PAUSER role", async function () {
      const { token, admin } = await loadFixture(deployTokenFixture);

      await expect(token.connect(admin).grantAdmin(admin.address)).to.be
        .reverted;
    }),
      it("Should allow only ADMIN to grant MINTER & PAUSER role", async function () {
        const { token, minter, pauser } = await loadFixture(
          deployTokenFixture
        );

        const MINTER_ROLE = await token.MINTER();
        expect(await token.hasRole(MINTER_ROLE, minter.address)).to.equal(
          true
        );

        const PAUSER_ROLE = await token.PAUSER();
        expect(await token.hasRole(PAUSER_ROLE, pauser.address)).to.equal(
          true
        );
      });

    it("Should not allow non-ADMIN to grant MINTER & PAUSER role", async function () {
      const { token, other, minter, pauser, owner } = await loadFixture(
        deployTokenFixture
      );

      // grant MINTER
      await expect(token.connect(other).grantMinter(minter.address)).to.be
        .reverted;
      await expect(token.connect(owner).grantMinter(minter.address)).to.be
        .reverted;

      // grant PAUSER
      await expect(token.connect(other).grantPauser(pauser.address)).to.be
        .reverted;
      await expect(token.connect(owner).grantPauser(pauser.address)).to.be
        .reverted;
    });

    it("Should allow PAUSER to pause and unpause the contract", async function () {
      const { token, pauser, admin } = await loadFixture(
        deployTokenFixture
      );

      // Pause the contract
      await token.connect(pauser).pause();
      expect(await token.paused()).to.equal(true);

      // Unpause the contract
      await token.connect(pauser).unpause();
      expect(await token.paused()).to.equal(false);
    });

    it("Should not allow non-PAUSER to pause or unpause the contract", async function () {
      const { token, other, owner } = await loadFixture(
        deployTokenFixture
      );

      await expect(token.connect(other).pause()).to.be.reverted;
      await expect(token.connect(owner).pause()).to.be.reverted;
      await expect(token.connect(other).unpause()).to.be.reverted;
      await expect(token.connect(owner).unpause()).to.be.reverted;
    });
  });

  describe("Burn", function () {
    it("Anyone should be able to burn tokens", async function () {
      const { token, minter, other } = await loadFixture(
        deployTokenFixture
      );

      // tokens minted to other
      await token
        .connect(minter)
        .mint(other.address, parseEther("1000"), "Testing mint");
      // other burns 500 tokens
      expect(
        await token.connect(other).burn(other.address, parseEther("500"))
      );
      // total supply should have 500 tokens left
      expect(await token.totalSupply()).to.be.equal(parseEther("500"));
    });

    it("Should not be able to burn tokens you don't have", async function () {
      const { token, other, minter } = await loadFixture(
        deployTokenFixture
      );

      await token
        .connect(minter)
        .mint(other.address, parseEther("1000"), "Testing mint");
      // user burns more tokens than he owns
      await expect(
        token.connect(other).burn(other.address, parseEther("1200"))
      ).to.be.reverted;
    });
  });

  describe("Transfer", function () {
    it("Should be able to transfer to anyone", async function () {
      const { token, other, random, minter } = await loadFixture(
        deployTokenFixture
      );

      await token
        .connect(minter)
        .mint(other.address, parseEther("1000"), "Testing mint");
      // make sure transaction works
      expect(
        await token
          .connect(other)
          .transfer(random.address, parseEther("800"))
      );
      // make sure transfer successful
      expect(await token.balanceOf(other.address)).to.be.equal(
        parseEther("200")
      );
      expect(await token.balanceOf(random.address)).to.be.equal(
        parseEther("800")
      );
    });

    it("Should not be able to transfer tokens that you don't have", async function () {
      const { token, other, random, minter } = await loadFixture(
        deployTokenFixture
      );

      await token
        .connect(minter)
        .mint(other.address, parseEther("1000"), "Testing mint");
      await expect(
        token.connect(other).transfer(random.address, parseEther("1001"))
      ).to.be.reverted;
    });
  });
});