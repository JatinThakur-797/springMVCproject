document.addEventListener('DOMContentLoaded', () => {
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const submitBtn = document.getElementById('submitBtn');
    const form = document.getElementById('multiPhaseForm');
    const phases = [...document.querySelectorAll('.form-phase')];
    const stepperItems = [...document.querySelectorAll('.stepper-item')];
    
    let currentPhase = 0;

    const updateFormPhase = () => {
        // Hide all phases and show the current one
        phases.forEach((phase, index) => {
            phase.classList.toggle('active', index === currentPhase);
        });

        // Update the stepper
        stepperItems.forEach((step, index) => {
            if (index < currentPhase) {
                step.classList.add('completed');
                step.classList.remove('active');
            } else if (index === currentPhase) {
                step.classList.add('active');
                step.classList.remove('completed');
            } else {
                step.classList.remove('active', 'completed');
            }
        });

        // Update button visibility
        prevBtn.style.display = currentPhase === 0 ? 'none' : 'inline-block';
        nextBtn.style.display = currentPhase === phases.length - 1 ? 'none' : 'inline-block';
        submitBtn.style.display = currentPhase === phases.length - 1 ? 'inline-block' : 'none';
    };

    const validatePhase = () => {
        const currentPhaseInputs = phases[currentPhase].querySelectorAll('[required]');
        let isValid = true;
        
        currentPhaseInputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.style.borderColor = 'red'; // Simple validation feedback
            } else {
                input.style.borderColor = '#dee2e6';
            }
        });

        if (!isValid) {
            alert('Please fill out all required fields before proceeding.');
        }
        return isValid;
    };

    nextBtn.addEventListener('click', () => {
        if (validatePhase()) {
            if (currentPhase < phases.length - 1) {
                currentPhase++;
                updateFormPhase();
            }
        }
    });

    prevBtn.addEventListener('click', () => {
        if (currentPhase > 0) {
            currentPhase--;
            updateFormPhase();
        }
    });
    
    form.addEventListener('submit', (e) => {
        if (!validatePhase()) {
            e.preventDefault(); // Stop form submission if the final phase is invalid
        }
    });

    // Initial call to set the correct view on page load
    updateFormPhase();
});