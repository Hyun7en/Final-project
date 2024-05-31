//옵션 추가

$(document).ready(function() {
        let options = [];

        $('#add-optionBtn').click(function() {
            let option = $('#enroll-option').val().trim();
            if (option) {
                // 배열에 옵션이 이미 존재하는지 검사
                if (options.includes(option)) {
                    alert('이미 추가된 옵션입니다.');
                } else {
                    options.push(option);
                    $('#optionList').append('<div data-option="' + option + '"><li>' + option + '</li><button class="removeBtn">x</button></div>');
                    $('#enroll-option').val('');  // 입력 필드 초기화
                    console.log(options);
                }
            } else {
                alert('옵션을 입력하세요.');
            }
        });

        $(document).on('click', '.removeBtn', function() {
            let optionDiv = $(this).parent();
            let option = optionDiv.data('option');
            let index = options.indexOf(option);
            if (index > -1) {
                options.splice(index, 1);
                optionDiv.remove();
                console.log(options);
            }
        });

        $('#enrollForm').submit(function(event) {
            let optionsInput = $('<input>').attr('type', 'hidden').attr('name', 'optionsJson').val(JSON.stringify(options));
            $(this).append(optionsInput);
        });

        $('#productImage').change(function(event) {
            let reader = new FileReader();
            reader.onload = function(e) {
                $('#preview-image').attr('src', e.target.result);
            }
            reader.readAsDataURL(event.target.files[0]);
        });
    });
