$(document).ready(function() {
    let categories = [];

    $('#add-categoryBtn').click(addCategory);

    // Enter 키를 눌렀을 때도 카테고리가 등록되도록 설정
    $('#enroll-category').on('keypress', function(event) {
        if (event.which == 13) { // Enter 키 코드가 13입니다.
            event.preventDefault(); // 폼 제출을 막습니다.
            addCategory();
        }
    });

    $(document).on('click', '.removeBtn', removeCategory);

    $('#enrollForm').submit(function(event) {
        let categoriesInput = $('<input>').attr('type', 'hidden').attr('name', 'categoriesJson').val(JSON.stringify(categories));
        $(this).append(categoriesInput);
    });

    $('#storeHomeImage').change(function(event) {
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#preview-image').attr('src', e.target.result);
        }
        reader.readAsDataURL(event.target.files[0]);
    });

    // 입력된 카테고리가 유효한지 확인하는 함수
    function isValidCategory(category) {
        return category.trim().length > 0; // 간단한 예: 공백이 아닌지 확인
    }

    // 카테고리를 추가하는 함수
    function addCategory() {
        let category = $('#enroll-category').val().trim();
        if (category && isValidCategory(category) && !categories.includes(category)) {
            categories.push(category);
            appendCategoryToList(category);
            $('#enroll-category').val('');  // 입력 필드 초기화
            console.log(categories);
            alert('카테고리가 성공적으로 추가되었습니다.');
        } else if (categories.includes(category)) {
            alert('이미 추가된 카테고리입니다.');
        } else {
            alert('카테고리에 빈값은 넣을수 없습니다.');
        }
    }

    // 카테고리를 목록에 추가하는 함수
    function appendCategoryToList(category) {
        $('#categoryList').append('<div data-category="' + category + '"><li>' + category + '</li><button class="removeBtn">x</button></div>');
    }

    // 카테고리를 제거하는 함수
    function removeCategory() {
        let categoryDiv = $(this).parent();
        let category = categoryDiv.data('category');
        categories = categories.filter(cat => cat !== category);
        categoryDiv.remove();
        console.log(categories);
        alert('카테고리가 성공적으로 제거되었습니다.');
    }
});
