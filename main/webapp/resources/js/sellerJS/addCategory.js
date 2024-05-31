//카테고리 추가

    $(document).ready(function() {
        let categories = [];

        $('#add-categoryBtn').click(function() {
            let category = $('#enroll-category').val().trim();
            if (category) {
                // 배열에 카테고리가 이미 존재하는지 검사
                if (categories.includes(category)) {
                    alert('이미 추가된 카테고리입니다.');
                } else {
                    categories.push(category);
                    $('#categoryList').append('<div data-category="' + category + '"><li>' + category + '</li><button class="removeBtn">x</button></div>');
                    $('#enroll-category').val('');  // 입력 필드 초기화
                    console.log(categories);
                }
            } else {
                alert('카테고리를 입력하세요.');
            }
        });

        $(document).on('click', '.removeBtn', function() {
            let categoryDiv = $(this).parent();
            let category = categoryDiv.data('category');
            let index = categories.indexOf(category);
            if (index > -1) {
                categories.splice(index, 1);
                categoryDiv.remove();
                console.log(categories);
            }
        });

        $('#enrollForm').submit(function(event) {
            let categoriesInput = $('<input>').attr('type', 'hidden').attr('name', 'categoriesJson').val(JSON.stringify(categories));
            $(this).append(categoriesInput);

            console.log("Submitting categories:", JSON.stringify(categories));
        });

        $('#storeHomeImage').change(function(event) {
            let reader = new FileReader();
            reader.onload = function(e) {
                $('#preview-image').attr('src', e.target.result);
            }
            reader.readAsDataURL(event.target.files[0]);
        });
    });