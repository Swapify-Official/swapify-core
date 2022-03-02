import { bytecode } from '../build/SwapifyPair.json'
import { keccak256 } from '@ethersproject/solidity'

import chai, { expect } from 'chai'

const COMPUTED_INIT_CODE_HASH = keccak256(['bytes'], [`0x${bytecode}`])

it('initHash', async () => {
    await expect(COMPUTED_INIT_CODE_HASH).to.eq('0xaa88248d2c33b38c915594503177388c1e70686c6befa21fa7f328b997072179')
})
