document.addEventListener('turbo:load', function() {
  const form = document.getElementById('multi-step-form');

  const stepSets = [
    ['step-1', 'next-step-1', null],
    ['step-2', 'next-step-2', 'prev-step-2'],
    ['step-3', 'next-step-3', 'prev-step-3'],
    ['step-4', 'next-step-4', 'prev-step-4'],
  ];

  for (let i = 0; i < stepSets.length; i++) {
    const [currentStep, nextStepButton, prevStepButton] = stepSets[i];

    const currentStepElement = document.getElementById(currentStep);
    const nextStepButtonElement = document.getElementById(nextStepButton);
    const prevStepButtonElement = document.getElementById(prevStepButton);

    nextStepButtonElement.addEventListener('click', function() {
      currentStepElement.style.display = 'none';
      const nextStepIndex = i + 1;
      if (nextStepIndex < stepSets.length) {
        document.getElementById(stepSets[nextStepIndex][0]).style.display = 'block';
      }
    });

    if (prevStepButtonElement) {
      prevStepButtonElement.addEventListener('click', function() {
        currentStepElement.style.display = 'none';
        const prevStepIndex = i - 1;
        if (prevStepIndex >= 0) {
          document.getElementById(stepSets[prevStepIndex][0]).style.display = 'block';
        }
      });
    }
  }
});
