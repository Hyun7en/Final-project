document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('add-optionBtn').addEventListener('click', function() {
        let table = document.querySelector('#div-enroll-option table');
        
        // 테이블에서 모든 옵션명 입력 필드를 찾아 중복 검사
        let optionInputs = table.querySelectorAll('input[type="text"]');
        let lastInput = optionInputs[optionInputs.length - 1];
        let optionValue = lastInput ? lastInput.value.trim() : "";

        // 옵션명이 비어있는 경우 경고
        if (optionValue === "") {
            alert("옵션명을 입력해주세요.");
            return;
        }

        // 중복 검사 수행
        let isDuplicate = Array.from(optionInputs, input => input.value.trim()).slice(0, -1).includes(optionValue);

        if (isDuplicate) {
            alert("이미 같은 옵션이 존재합니다.");
            return;
        }

        // 중복이 아니면 행 추가
        addNewOptionRow(table);
    });

    function addNewOptionRow(table) {
        let newTr = document.createElement('tr');

        let td1 = document.createElement('td');
        let input1 = document.createElement('input');
        input1.type = 'text';
        input1.placeholder = '옵션명 입력';
        td1.appendChild(input1);
        newTr.appendChild(td1);

        let td2 = document.createElement('td');
        let input2 = document.createElement('input');
        input2.type = 'number';
        input2.min = '0';
        input2.placeholder = '수량';
        td2.appendChild(input2);
        newTr.appendChild(td2);

        let td3 = document.createElement('td');
        let removeBtn = document.createElement('button');
        removeBtn.textContent = '제거';
        removeBtn.className = 'remove-btn';
        removeBtn.onclick = function(event) {
            let tr = event.target.closest('tr');
            tr.remove(); // 해당 행 제거
        };
        td3.appendChild(removeBtn);
        newTr.appendChild(td3);

        table.appendChild(newTr);
    }
});
