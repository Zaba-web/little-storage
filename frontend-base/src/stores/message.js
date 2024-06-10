import { writable } from "svelte/store";

export let defaultMessageState = {
  title: "",
  message: ""
}

export const MessageStore = writable(defaultMessageState)

export const createMessage = (title, message) => {
  return { title: title, message: message }
}
