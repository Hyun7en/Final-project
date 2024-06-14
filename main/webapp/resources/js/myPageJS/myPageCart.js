function count(type){
    const result = document.getElementById("product-count");

    let number = result.innerText;

    if(type === 'minus') {
        if(number != 1){
            number = parseInt(number) -1;
        }
    } else if(type === 'plus') {
        number = parseInt(number) + 1;
    }

    result.innerText = number;
}