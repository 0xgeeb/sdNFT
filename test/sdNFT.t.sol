//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../lib/forge-std/src/Test.sol";
import { sdNFT } from "../src/sdNFT.sol";

contract BorrowTest is Test {

  sdNFT sdnft;

  address geeb = 0xcBf203F2ee13702Ec41404856f75357e0872484e;
  address sfrxeth = 0xac3E018457B222d93114458476f3E3416Abbe38F;


  function setUp() public {
    sdnft = new sdNFT(geeb, sfrxeth);
  }


  function testGeebSfrxethBalance() public view {
    uint256 racks = sdnft.checksdLevel(geeb);
    console.log(racks);
  }
}