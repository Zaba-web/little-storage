<script>
  import { createEventDispatcher } from "svelte";
  import { validate } from "../../../utils/validator";

  export let label;
  export let placeholder;
  export let type;
  export let id;
  export let validationRules;

  const dispatch = createEventDispatcher();

  $: value = "";
  $: errorMessages = [];

  const updateValue = (e) => {
    value = e.target.value;

    if (validationRules) {
      errorMessages = validate(validationRules, value);
      if (errorMessages.length != 0) {
        dispatch("validation-update", { id: id, valid: false });
      } else {
        dispatch("validation-update", { id: id, valid: true });
      }
    }

    dispatch("value-changed", { id: id, value: value });
  };
</script>

<div class="mt-4 w-full">
  <label
    for={id}
    class="block font-theme-default text-theme-gray font-semibold mb-1"
    >{label}</label
  >
  <input
    class="input-field"
    {type}
    {id}
    {placeholder}
    {value}
    on:keyup={updateValue}
  />
  {#each errorMessages as message}
    <div class="font-theme-default mt-2 text-sm font-light text-red-800">
      {message}
    </div>
  {/each}
</div>
