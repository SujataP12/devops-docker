let cart = [];

function addToCart(coffee) {
    cart.push(coffee);
    document.getElementById('cart-count').innerText = cart.length;
}

function viewCart() {
    const cartModal = document.getElementById('cart-modal');
    const cartItemsList = document.getElementById('cart-items');
    
    // Clear previous items
    cartItemsList.innerHTML = '';

    // Add current items to the list
    cart.forEach(item => {
        const listItem = document.createElement('li');
        listItem.innerText = item;
        cartItemsList.appendChild(listItem);
    });

    cartModal.style.display = "block";
}

function closeCart() {
    document.getElementById('cart-modal').style.display = "none";
}

function checkout() {
    alert('Thank you for your order!');
    cart = [];
    document.getElementById('cart-count').innerText = 0;
    closeCart();
}
