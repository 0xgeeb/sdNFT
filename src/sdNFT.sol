// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { ERC721 } from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract sdNFT is ERC721URIStorage {
    
  uint256 public tokenId;
  
  address public geeb;
  address public sfrxeth;

  constructor(address _geeb, address _sfrxeth) ERC721("Staking Derivative NFT", "sdNFT") {
    geeb = _geeb;
    srfxeth = _sfrxeth;
  }
  
  function mint() external {
    uint256 _tokenId = tokenId;
    _safeMint(msg.sender, _tokenId);
    string memory svg = generateSVG();
    string memory imageURI = svgToImageURI(svg);
    _setTokenURI(_tokenId, formatTokenURI(imageURI));
    tokenId++;
  }


}
