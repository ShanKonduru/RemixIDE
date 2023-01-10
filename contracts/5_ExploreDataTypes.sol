// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract  ExploreDataTypes{
    string public name = "Shan Konduru";
    bool public married = true;
    uint256 public salary = 100000000.00;
    enum OrgType {Unemployed, PublicLimited, PrivateLimited, NGO}
    OrgType public workingIn =  OrgType.Unemployed; 

    function setOrgTypeAsPublicLimited() public {
        workingIn =  OrgType.PublicLimited;
    }

    function setOrgTypeAsPrivateLimited() public {
        workingIn =  OrgType.PrivateLimited;
    }

    function setOrgType(OrgType _value) public {
        workingIn =  _value;
    }

}