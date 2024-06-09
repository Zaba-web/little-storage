import axios from "axios";
import { GATEWAY_URL } from "./env";

const CREATE_USER_ENDPOINT = "user/register";

export const CREATED = 204;
export const ALREADY_EXISTS = 409;

export const createUser = async userData => {
  try {
    const result = await axios.post(GATEWAY_URL + CREATE_USER_ENDPOINT, userData)
    return result.status;
  } catch (err) {
    return err.response.status;
  }
}
