import * as dotenv from "dotenv"; // 他より先に読み込む必要があるらしい
dotenv.config();

import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  //mumbaiを追加
  networks: {
    mumbai: {
      url: process.env.API_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};

export default config;
