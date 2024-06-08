let translations = {
  "en": {},
  "ua": {}
}

export const getCurrentLanguage = () => {
  return "en"; // TODO: change to actual language checking
}

export const __ = phrase => {
  const lang = getCurrentLanguage()

  if (phrase in translations[lang]) {
    return translations[lang][phrase]
  }

  return phrase;
}
