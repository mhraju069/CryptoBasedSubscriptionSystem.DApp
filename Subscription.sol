// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Subscription {
    address public owner;

    constructor(uint basic, uint standard, uint premium, uint duration) {
        owner = msg.sender;
        plans[Name.Basic] = Plan(Name.Basic, basic, duration * 1 days, true);
        plans[Name.Standard] = Plan(Name.Standard, standard, duration * 1 days, true);
        plans[Name.Premium] = Plan(Name.Premium, premium, duration * 1 days, true);
    }

    modifier OnlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

    enum Name {Basic,Standard,Premium}

    struct Plan {
        Name plan;
        uint price;
        uint duration;
        bool active;
    }


    mapping(Name => Plan) public plans;
    mapping(address => uint) public expiry;
    mapping(address => Plan) public subscription;
    event Subscribed(address user, Name plan, uint expiry);


    function UpgradePlan(Name name,uint price,uint duration,bool active) public OnlyOwner {
        Plan storage plan = plans[name];
        plan.price = price;
        plan.duration = duration * 1 days;
        plan.active = active;
    }


    function Subscribe(Name name) external payable {
        Plan memory plan = plans[name];

        require(plan.active, "Plan inactive");
        require(msg.value >= plan.price, "Insufficient amount");

        subscription[msg.sender] = plan;

        uint expire = block.timestamp + plan.duration;
        expiry[msg.sender] = expire;

        emit Subscribed(msg.sender, name, expire);
    }


    function isActive(address user) public returns (bool) {
        bool active = expiry[user] > block.timestamp;
        if (active == false) {
            Plan storage plan = subscription[user];
            plan.active = false;
        }
        return active;
    }


    function withdraw() public OnlyOwner {
    payable(owner).transfer(address(this).balance);
    }

}
