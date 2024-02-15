setTimeout(() => {
    const flash = document.querySelector('.flash')
    if(flash.classList.contains('fade-out')) {
        flash.style.opacity = 0
    }
}, 3000)