<script>
  import { __ } from "../../../utils/transalte";
  import ukFlag from "../../../assets/icons/language/uk.svg";
  import uaFlag from "../../../assets/icons/language/ua.svg";
  import arrowDown from "../../../assets/icons/arrow_down.svg";
  import { slide } from "svelte/transition";

  $: currentLanguageCode = localStorage.getItem("languageCode") || "en";
  $: expanded = false;

  let languageList = {
    en: {
      name: __("English"),
      image: ukFlag,
    },
    ua: {
      name: __("Ukrainian"),
      image: uaFlag,
    },
  };

  $: currentLanguage = languageList[currentLanguageCode];

  const changeLanguage = (code) => {
    currentLanguage = languageList[code];
    localStorage.setItem("languageCode", code);
    expanded = false;
  };
</script>

<div class="relative">
  <div
    class="flex gap-2 cursor-pointer"
    on:click={() => (expanded = !expanded)}
    role="button"
  >
    <img src={currentLanguage.image} alt={currentLanguage.name} class="w-4" />
    <span
      class="font-theme-default text-theme-gray font-medium flex items-center gap-2"
    >
      {currentLanguage.name}
      <img src={arrowDown} alt="Expand" />
    </span>
  </div>
  {#if expanded}
    <div class="absolute" transition:slide>
      {#each Object.keys(languageList) as language}
        <div
          class="flex gap-2 cursor-pointer mt-3"
          on:click={() => {
            changeLanguage(language);
          }}
        >
          <img
            src={languageList[language].image}
            alt={languageList[language].name}
            class="w-4"
          />
          <span
            class="font-theme-default text-theme-gray-dark hover:text-theme-gray font-medium flex items-center gap-2"
          >
            {languageList[language].name}
          </span>
        </div>
      {/each}
    </div>
  {/if}
</div>
