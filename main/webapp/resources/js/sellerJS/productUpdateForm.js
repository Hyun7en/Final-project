$(function() {
    selectOptions();

    function selectOptions() {
        $.ajax({
            url: "options.ax",
            method: "GET",
            data: { pno: pno },
            success: function(res) {
                console.log("ajax 성공", res);
                drawOptions(res);
            },
            error: function(err) {
                console.log("options.ax 통신 실패", err);
                alert("옵션을 가져오는 데 실패했습니다. 페이지를 새로고침해주세요.");
            }
        });
    }

    function drawOptions(options) {
        let $table = $('#div-enroll-option table');
        $table.empty();

        if (!options || options.length === 0) {
            console.log('No options received or options array is empty');
            return;
        }

        console.log("Drawing options:", options);
        options.forEach(function(option) {
            addOptionRow(option.optionName, option.pdCount, option.pdOptionNo, 'existing');
        });
    }

    $('#add-optionBtn').click(function() {
        addOptionRow("", "", "0", 'new');
    });

    function addOptionRow(optionName, pdCount, pdOptionNo, status) {
        let $table = $('#div-enroll-option table');

        // 중복 옵션 확인
        let duplicate = false;
        $table.find('tr').each(function() {
            let existingOptionName = $(this).find('input[name="optionNames[]"]').val();
            if (existingOptionName === optionName && $(this).attr('data-status') !== 'deleted') {
                duplicate = true;
                return false; // 중복 옵션 발견 시 루프 종료
            }
        });

        if (duplicate) {
            alert('이미 존재하는 옵션입니다.');
            return;
        }

        let $newTr = $('<tr>').attr('data-status', status);

        console.log("Adding option row:", optionName, pdCount, status);
        let newRowContent = `
            <td><input type="text" name="optionNames[]" value="${optionName}" class="option-input"/></td>
            <td><input type="number" name="optionQuantities[]" value="${pdCount}" class="option-quantity"/></td>
            <td>
                <input type="hidden" name="optionStatus[]" value="${status}" class="option-status"/>
                <input type="hidden" name="pdOptionNo[]" value="${pdOptionNo}"/>
                <button type="button" class="remove-btn">제거</button>
            </td>
        `;

        $newTr.html(newRowContent);
        $table.append($newTr);
    }

    $(document).on('click', '.remove-btn', function() {
        let $row = $(this).closest('tr');
        if ($row.attr('data-status') === 'new') {
            $row.remove();
        } else {
            $row.find('.option-status').val('deleted');
            $row.attr('data-status', 'deleted');
            $row.hide();
        }
    });

    $(document).on('change', 'input.option-input, input.option-quantity', function() {
        let $row = $(this).closest('tr');
        if ($row.attr('data-status') === 'existing') {
            $row.attr('data-status', 'updated');
            $row.find('.option-status').val('updated');
        }
    });

    // 스토어 홈 이미지 변경 시 미리보기 기능
    $('#productImage').change(function(event) {
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#preview-image').attr('src', e.target.result);
        }
        reader.readAsDataURL(event.target.files[0]);
    });

    // 폼 제출 전에 existing 상태의 옵션을 제거합니다.
    $('form').submit(function(e) {
        $('#div-enroll-option table tr[data-status="existing"]').remove();
    });
});
