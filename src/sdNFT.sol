// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


/*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
/*                            sdNFT                           */
/*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/


import { ERC721 } from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import { ERC721URIStorage } from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { IsfrxETH } from "./interfaces/IsfrxETH.sol";


/// @title sdNFT
/// @notice Dynamic NFT depending on LSD holdings
/// @author geeb
contract sdNFT is ERC721URIStorage {


  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                      STATE VARIABLES                       */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
    

  uint256 public tokenId;
  
  address public geeb;
  address public sfrxeth;


  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                         CONSTRUCTOR                        */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

  /// @notice Constructor of this contract
  /// @param _geeb Address of geeb
  /// @param _sfrxeth Address of sfrxETH
  constructor(address _geeb, address _sfrxeth) ERC721("Staking Derivative NFT", "sdNFT") {
    geeb = _geeb;
    sfrxeth = _sfrxeth;
  }


  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                       VIEW FUNCTIONS                       */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
  

  /// @notice View the sdLevel of an address
  /// @param user Addres to view sdLevel
  function checksdLevel(address user) external view returns (uint256) {
    user = geeb;
    return _checksdLevel(user);
  }


  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                    EXTERNAL FUNCTIONS                      */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/


  /// @notice Mints a sdNFT
  function mint() external {
    uint256 _tokenId = tokenId;
    _safeMint(msg.sender, _tokenId);
    string memory svg = generateSVG();
    string memory imageURI = svgToImageURI(svg);
    _setTokenURI(_tokenId, formatTokenURI(imageURI));
    tokenId++;
  }


  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                      INTERNAL FUNCTIONS                    */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/


  /// @notice View the sdLevel of an address
  /// @param user Addres to view sdLevel
  function _checksdLevel(address user) internal view returns (uint256 level) {
    level = IsfrxETH(sfrxeth).balanceOf(user);
  }

  function generateSVG() internal pure returns (string memory svg) {
    svg = 'hello';
  }

  function svgToImageURI(string memory svg) internal pure returns (string memory imageURI) {
    imageURI = svg;
  }

  function formatTokenURI(string memory imageURI) internal pure returns (string memory tokenURI) {
    tokenURI = imageURI;
  }


}
