# Crypto Based Subscription System

A **premium, on-chain subscription management system** built in Solidity for Ethereum.  
Supports multiple subscription plans (Basic, Standard, Premium) with **upgradeable pricing and duration**, providing a **Django-style smart contract model** for clean, scalable subscriptions.

---

## 🚀 Features (Current)

- **Multiple Subscription Plans:** Basic, Standard, Premium.
- **Upgradeable Plans:** Admin can modify price, duration, and active status.
- **User Subscription Management:** Users can subscribe and upgrade their plan.
- **Subscription Expiry Tracking:** Automatic expiry timestamp per user.
- **Event Logging:** `Subscribed` event emitted for each subscription.
- **Owner Controls:** Only owner can manage plans and withdraw funds.
- **Secure Withdrawals:** Admin can withdraw collected Ether securely.

---

## 🏗 Contract Architecture

Enum: Plan Names
```
enum Name { Basic, Standard, Premium }
```
Struct: Plan
```
struct Plan {
    Name plan;
    uint price;
    uint duration;
    bool active;
}
```
Mappings
```
mapping(Name => Plan) public plans;
mapping(address => Name) public userPlan;
mapping(address => uint) public expiry;
```
⚡ Usage
Deploy Contract: Deploy on Ethereum or Ethereum-compatible testnets (e.g., Goerli).

Admin Plan Setup: Set plan prices and durations via UpgradePlan().

User Subscription: Users call Subscribe(Name plan) with sufficient Ether.

Track Expiry: Contract automatically tracks subscription expiry.

Withdraw Funds: Admin can withdraw contract balance using withdraw().

🔮 Roadmap (Next Steps)
1️⃣ Multi-Chain Integration
Support for:

Solana

Binance Smart Chain (BSC)

Bitcoin-based sidechains

Enable users to subscribe using native tokens on multiple chains.

2️⃣ Backend & Real-Time Updates
Build a backend system for:

Real-time subscription status updates

Webhooks for external notifications

User dashboards and analytics

Subscription history and reporting

3️⃣ Advanced Features
Plan renewal / auto-renewal

Upgrade / downgrade logic

Refund system for early upgrades

Multi-admin support

Gas optimization for high volume usage

Frontend integration (React / Next.js)

Off-chain metadata storage (IPFS / Arweave)

💎 Why This DApp is Premium
Clean, modular Solidity architecture

Django-style contract modeling for scalability

Ready for multi-chain expansion

Event-driven design for real-time updates

Extensible for enterprise SaaS use-cases

📌 License
MIT License – free to use, modify, and distribute.

