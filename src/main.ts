import { Actor } from 'apify';
import { Input } from './types.js';

await Actor.init();
const input = await Actor.getInput<Input>();

if (!input) {
  throw new Error('Input is missing!');
}

// Write your business logic here
const result = {};

await Actor.pushData(result);

await Actor.exit();
