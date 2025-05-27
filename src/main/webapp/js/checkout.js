document.addEventListener('DOMContentLoaded', function () {
    const orderItemsDiv = document.getElementById('order-items');
    const totalPriceSpan = document.getElementById('total-price');
    const confirmOrderBtn = document.getElementById('confirm-order');

    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    if (cart.length > 0) {
        let total = 0;

        cart.forEach(item => {
            let itemDiv = document.createElement('div');
            itemDiv.className = 'item';
            itemDiv.innerHTML = `
                <img src="${item.image}" alt="${item.name}">
                <div class="content">
                    <h3>${item.name}</h3>
                    <span class="price">${item.price}</span>
                </div>
            `;
            orderItemsDiv.appendChild(itemDiv);
            total += parseFloat(item.price.replace('$', ''));
        });

        totalPriceSpan.textContent = `$${total.toFixed(2)}`;
    } 

    confirmOrderBtn.addEventListener('click', function () {
        if (cart.length === 0) {
            alert('No items to order.');
            return;
        }

        // Example data to send to the server
        const orderData = {
            items: cart,
            total: totalPriceSpan.textContent
        };

        // Send order data to your server
        fetch('your-server-endpoint', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(orderData)
        })
        .then(response => response.json())
        .then(data => {
            localStorage.removeItem('cart');
            alert('Order placed successfully!');
            window.location.href = 'thank-you.html';
        })
        .catch(error => {
            console.error('Error placing order:', error);
            alert('Failed to place order.');
        });
    });
});



document.getElementById('confirm-order').addEventListener('click', function () {
    localStorage.removeItem('cart');
    // Redirect to confirmation or thank you page
    window.location.href = 'thank-you.html';
});

