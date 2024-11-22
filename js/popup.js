
let selectedService = '';

// Add click event listener to all contact buttons
document.addEventListener('DOMContentLoaded', function() {
    // Add click handlers to all contact buttons
    const contactButtons = document.querySelectorAll('.contact');
    contactButtons.forEach(button => {
        button.addEventListener('click', showPopup);
    });

    // Add click outside handler to popup
    document.getElementById('contactPopup').addEventListener('click', function(event) {
        if (event.target === this) {
            closePopup();
        }
    });

    // Initialize contact links
    updateContactLinks();
});

function showPopup() {
    const popup = document.getElementById('contactPopup');
    popup.style.display = 'flex';
    // Trigger reflow
    popup.offsetHeight;
    popup.style.opacity = '1';
    popup.querySelector('.popup-container').style.transform = 'translateY(0)';

    // Reset any previously selected service
    document.querySelectorAll('.service-option').forEach(option => {
        option.classList.remove('selected');
    });
    selectedService = '';
    updateContactLinks();
}

function closePopup() {
    const popup = document.getElementById('contactPopup');
    popup.style.opacity = '0';
    popup.querySelector('.popup-container').style.transform = 'translateY(20px)';
    setTimeout(() => {
        popup.style.display = 'none';
    }, 300);
}

function selectService(element, service) {
    // Remove selected class from all options
    document.querySelectorAll('.service-option').forEach(option => {
        option.classList.remove('selected');
    });
    // Add selected class to clicked option
    element.classList.add('selected');
    selectedService = service;
    
    // Update the href attributes of contact buttons with the new message
    updateContactLinks();
}

function getServiceMessage() {
    let serviceDetails = {
        'website': 'website development',
        'wordpress': 'WordPress plugin development',
        'cloudinary': 'Cloudinary integration and setup',
        'ezoic': 'Ezoic ads optimization and setup'
    };
    
    return `Hi Amitabh, I need help with ${serviceDetails[selectedService] || 'your services'}. Can you assist me?`;
}

function updateContactLinks() {
    const message = encodeURIComponent(getServiceMessage());
    
    // Update WhatsApp link
    const whatsappLink = document.querySelector('a[href*="wa.me"]');
    whatsappLink.href = `https://wa.me/+919101114705?text=${message}`;
    
    // Update Email link
    const emailLink = document.querySelector('a[href*="mailto"]');
    const subject = encodeURIComponent(`Inquiry about ${selectedService || 'services'}`);
    emailLink.href = `mailto:aomi@duck.com?subject=${subject}&body=${message}`;
}

function openChat() {
    // Open Brevo chat
    BrevoConversations('openChat', true);
    
    // If Brevo has a method to set initial message, use it
    const message = getServiceMessage();
    try {
        // Try to set the message in Brevo chat
        BrevoConversations('sendMessage', message);
    } catch (e) {
        console.log('Message setting not supported by Brevo');
    }
}