$(document).ready(function() {
    let categories = []; // 현재 카테고리 배열
    let originalCategories = []; // 원래 카테고리 배열

    // 페이지 로드 시 카테고리 목록을 가져오고, 그리기
    selectCategories(function(categoriesFromServer){
        categories = categoriesFromServer;
        originalCategories = [...categoriesFromServer]; // 깊은 복사
        drawCategories(categories);
    });

    // 카테고리 목록을 서버로부터 가져오는 함수
    function selectCategories(callback) {
        $.ajax({
            url: "categories.ax", // 서버 URL
            method: "GET",
            success: function(res) {
                callback(res);
            },
            error: function() {
                console.log("categories.ax 통신 실패");
            }
        });
    }

    // 카테고리를 화면에 그리는 함수
    function drawCategories(categoriesToDraw) {
        let $categoryList = $('#categoryList');
        $categoryList.empty(); // 기존의 카테고리 초기화

        if (!categoriesToDraw || categoriesToDraw.length === 0) {
            console.log('No categories received or categories array is empty');
            return;
        }

        categoriesToDraw.forEach(function(category) {
            if (category && category.pdCategory) {
                $categoryList.append($('<div data-category="' + category.pdCategory + '">').append($('<li>').text(category.pdCategory)).append('<button class="removeBtn">x</button>'));
            } else {
                console.log('Invalid category data', category);
            }
        });
    }

    // 카테고리 추가 이벤트
    $('#add-categoryBtn').click(function() {
        let category = $('#enroll-category').val().trim();
        if (category) {
            if (categories.some(cat => cat.pdCategory === category)) {
                alert('이미 추가된 카테고리입니다.');
            } else {
                categories.push({ pdCategory: category }); // 배열에 추가
                $('#categoryList').append($('<div data-category="' + category + '">').append($('<li>').text(category)).append('<button class="removeBtn">x</button>'));
                $('#enroll-category').val(''); // 입력 필드 초기화
                console.log(categories);
            }
        } else {
            alert('카테고리를 입력하세요.');
        }
    });

    // Enter 키를 눌렀을 때 카테고리 추가 이벤트
    $('#enroll-category').keypress(function(event) {
        if (event.which == 13) { // Enter 키 코드가 13입니다.
            event.preventDefault(); // 폼 제출을 막습니다.
            $('#add-categoryBtn').click(); // 카테고리 추가 버튼 클릭 이벤트 호출
        }
    });

    // 카테고리 제거 이벤트
    $(document).on('click', '.removeBtn', function() {
        let categoryDiv = $(this).parent();
        let category = categoryDiv.data('category');
        categories = categories.filter(cat => cat.pdCategory !== category);
        categoryDiv.remove(); // 화면에서 제거
        console.log(categories);
    });

    // 폼 제출 시 추가된 카테고리와 삭제된 카테고리를 JSON 형식으로 변환하여 폼에 추가
    $('#enrollForm').submit(function(event) {
        let addCategories = categories.filter(cat => !originalCategories.some(origCat => origCat.pdCategory === cat.pdCategory));
        let deleteCategories = originalCategories.filter(origCat => !categories.some(cat => cat.pdCategory === origCat.pdCategory));
        
        let categoriesData = {
            addCategories: addCategories,
            deleteCategories: deleteCategories
        };

        let categoriesInput = $('<input>').attr('type', 'hidden').attr('name', 'categoriesJson').val(JSON.stringify(categoriesData));
        $(this).append(categoriesInput);
        console.log("Submitting categories:", JSON.stringify(categoriesData));
    });

    // 스토어 홈 이미지 변경 시 미리보기 기능
    $('#storeHomeImage').change(function(event) {
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#preview-image').attr('src', e.target.result);
        }
        reader.readAsDataURL(event.target.files[0]);
    });
});