import axios from "axios";
import { GATEWAY_URL } from "./env";

const CREATE_USER_ENDPOINT = "user/register";
const LOGIN_USER_ENDPOINT = "user/login";

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

export const login = async userCreds => {
  try {
    const result = await axios.post(GATEWAY_URL + LOGIN_USER_ENDPOINT, userCreds)
    saveUserData(result.data.response);
    return { responseText: result.data.response, statusCode: result.data.status }
  } catch (err) {
    return { responseText: err.response.data.response, statusCode: err.response.data.status }

  }
}

const saveUserData = (response) => {
  const tokens = JSON.parse(response)
  localStorage.setItem("access", tokens.access)
  localStorage.setItem("refresh", tokens.refresh)
}
