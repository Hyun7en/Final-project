function init(condition){
    console.log(condition);
    const opt = document.querySelector("#admin-board-category option[value=" + condition + "]");
    opt.setAttribute("selected", true);

}