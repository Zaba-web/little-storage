<script>
  import { __ } from "../../../utils/transalte";
  import FormInput from "./form-input.svelte";
  import { validators } from "../../../utils/validator";

  $: step = 1;
  $: formData = {
    email: "",
    first_name: "",
    last_name: "",
    password: "",
    password_confirm: "",
  };

  const updateFormData = (id, val) => {
    formData[id] = val;
    formData = {
      ...formData,
    };
  };

  const changeStep = (newStep) => {
    step = newStep;
  };

  const sendForm = (e) => {
    console.log(e);
  };
</script>

<form method="POST" action="/user/register" on:submit|preventDefault={sendForm}>
  <div class="w-full overflow-clip mt-2">
    <div
      class="w-[200%] flex gap-4 transition-all {step == 2 &&
        'register-step-2'}"
    >
      <div class="w-full">
        <FormInput
          label={__("Email")}
          placeholder={__("Enter your email")}
          type="email"
          id="email"
          validationRules={[validators.minLength(5), validators.maxLength(255)]}
          on:value-changed={(e) => updateFormData(e.detail.id, e.detail.value)}
        />

        <FormInput
          label={__("First name")}
          placeholder={__("Enter your name")}
          type="text"
          id="first_name"
          validationRules={[validators.minLength(1), validators.maxLength(255)]}
          on:value-changed={(e) => updateFormData(e.detail.id, e.detail.value)}
        />

        <FormInput
          label={__("Last name")}
          placeholder={__("Enter your surname")}
          type="text"
          id="last_name"
          validationRules={[validators.minLength(1), validators.maxLength(255)]}
          on:value-changed={(e) => updateFormData(e.detail.id, e.detail.value)}
        />
      </div>
      <div class="w-full">
        <FormInput
          label={__("Password")}
          placeholder={__("Enter your password")}
          type="password"
          id="password"
          validationRules={[validators.minLength(8), validators.maxLength(255)]}
          on:value-changed={(e) => updateFormData(e.detail.id, e.detail.value)}
        />

        <FormInput
          label={__("Password confirmation")}
          placeholder={__("Repeat your password")}
          type="password"
          id="password_confirm"
          validationRules={[
            validators.minLength(8),
            validators.maxLength(255),
            validators.sameAs(formData.password, "Password", "confirmation"),
          ]}
          on:value-changed={(e) => updateFormData(e.detail.id, e.detail.value)}
        />
      </div>
    </div>
  </div>
  <div class="mt-4 flex justify-between">
    <div class={step == 1 && "hidden"}>
      <button
        class="button button-regular"
        type="button"
        on:click={() => changeStep(1)}
      >
        Back
      </button>
    </div>
    <div class={step == 1 && "hidden"}>
      <button class="button button-accent" type="submit"> Send </button>
    </div>
    <div class={step != 1 && "hidden"}>
      <button
        class="button button-regular"
        type="button"
        on:click={() => changeStep(2)}>Next</button
      >
    </div>
  </div>
</form>

<style>
  .register-step-2 {
    transform: translateX(-51%);
  }
</style>
