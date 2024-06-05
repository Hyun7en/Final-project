$(document).ready(function() {
    // 페이지 로드 시 카테고리 목록을 가져오고, 그리기
    selectCategories();

    function selectCategories() {
        $.ajax({
            url: "categories.ax", // 서버 URL
            method: "GET",
            success: function(res) {
                drawCategories(res);
            },
            error: function() {
                console.log("categories.ax 통신 실패");
                alert("카테고리를 가져오는 데 실패했습니다. 페이지를 새로고침해주세요.");
            }
        });
    }

    function drawCategories(categories) {
        let $selectCategory = $('#select-category');
        $selectCategory.empty(); // 기존의 옵션들을 초기화

        if (!categories || categories.length === 0) {
            console.log('No categories received or categories array is empty');
            return;
        }

        // 카테고리 목록의 각 항목에 대해 option 요소를 생성하여 추가
        categories.forEach(function(category) {
            if (category) {
                console.log("Category:", category); // 디버깅을 위해 로그 추가
                $selectCategory.append($('<option>').text(category.pdCategory).val(category.caNo)); // 값을 caNo로 사용
            } else {
                console.log('Invalid category data', category);
            }
        });

        // 첫 번째 카테고리 항목을 선택
        if ($selectCategory.find('option').length > 0) {
            $selectCategory.val($selectCategory.find('option:first').val());
        }
    }
});
