document.addEventListener('turbo:load', function () {
  var steps = document.querySelectorAll(".step");
  var currentStep = 0;

  function showStep(stepIndex) {
    if (stepIndex >= 0 && stepIndex < steps.length) {
      steps[currentStep].style.display = "none";
      steps[stepIndex].style.display = "block";
      currentStep = stepIndex;
    }
  }

  document.getElementById("next-step-1").addEventListener("click", function () {
    showStep(1);
  });

  document.getElementById("prev-step-2").addEventListener("click", function () {
    showStep(0);
  });

  document.getElementById("next-step-2").addEventListener("click", function () {
    showStep(2);
  });

  document.getElementById("prev-step-3").addEventListener("click", function () {
    showStep(1);
  });
});
