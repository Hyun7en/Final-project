function boCategory(category){
    location.href = "list.co?category=" + category + "&cpage=1";
}

// function categorySelected() {
//     function getCategoryFromUrl() {
//         const params = new URLSearchParams(window.location.search);
//         return params.get('category');
//     }
//     var buttons = document.querySelectorAll(".com-nav");
//     const category = getCategoryFromUrl();

//     buttons.forEach(function(button){

//         if(button.value === category){
//             button.id = "com-nav-selected";
//         }
//     })
// }


// function show(boardLevel, cpage, boardNo){
//     location.href = "detail.co?category=" + boardLevel + "&cpage=" + cpage + "&boardNo=" + boardNo;
// }

