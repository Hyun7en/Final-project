    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('enrollForm');
        const table = document.querySelector('#div-enroll-option table');
        const addOptionBtn = document.getElementById('add-optionBtn');
    
        addOptionBtn.addEventListener('click', function() {
            addOption();
        });
    
        // 폼 제출 이벤트 핸들러
        form.addEventListener('submit', function(event) {
            if (!validateOptions()) {
                event.preventDefault(); // 중복이 발견되면 폼 제출 방지
                alert("중복된 옵션이 존재합니다. 중복된 옵션을 제거하거나 수정해 주세요.");
            }
        });
    
        function addOption() {
            let optionInputs = table.querySelectorAll('input[type="text"]');
            let lastInputValue = optionInputs.length > 0 ? optionInputs[optionInputs.length - 1].value.trim() : "";
    
            if (optionInputs.length > 0 && lastInputValue === "") {
                alert("옵션명을 입력해주세요.");
                return;
            }
    
            if (optionInputs.length > 0) {
                let isDuplicate = Array.from(optionInputs, input => input.value.trim()).slice(0, -1).includes(lastInputValue);
                if (isDuplicate) {
                    alert("중복된 옵션이 존재합니다. 중복된 옵션을 제거하거나 수정해 주세요.");
                    return;
                }
            }
    
            addNewOptionRow();
        }
    
        function addNewOptionRow() {
            let newTr = document.createElement('tr');
    
            let td1 = document.createElement('td');
            let input1 = document.createElement('input');
            input1.type = 'text';
            input1.name = 'optionNames[]';
            input1.placeholder = '옵션명 입력';
            td1.appendChild(input1);
            newTr.appendChild(td1);
    
            let td2 = document.createElement('td');
            let input2 = document.createElement('input');
            input2.type = 'number';
            input2.name = 'optionQuantities[]';
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
    
        function validateOptions() {
            let optionInputs = table.querySelectorAll('input[type="text"]');
            let values = Array.from(optionInputs, input => input.value.trim());
            let uniqueValues = new Set(values);
            return values.length === uniqueValues.size; // 중복이 없으면 true 반환
        }

        // 이미지 미리보기 기능
        document.getElementById('productImage').addEventListener('change', function() {
            let file = this.files[0];
            if (file) {
                let reader = new FileReader();
                reader.onload = function(e) {
                    let previewImage = document.getElementById('preview-image');
                    previewImage.src = e.target.result; // 미리보기 이미지 설정
                    previewImage.style.display = 'block'; // 이미지가 보이도록 설정
                };
                reader.readAsDataURL(file);
            }
        });
    });