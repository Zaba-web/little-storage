import { __ } from "./transalte"

export const validators = {
  minLength: length => value => {
    return value.length >= length ? "" : (length == 1 ? __("Field can not be empty.") : (__("Minimum length is ") + length.toString() + __(" characters.")))
  },
  maxLength: length => value => {
    return value.length <= length ? "" : (__("Maximum length is ") + length.toString() + __(" characters."))
  },
  sameAs: (compare, valueName, asName) => value => {
    return value == compare ? "" : (valueName + __(" should be the same as ") + asName)
  }
}

export const validate = (rules, value) => {
  return rules.map(r => r(value)).filter(msg => msg != null)
}
