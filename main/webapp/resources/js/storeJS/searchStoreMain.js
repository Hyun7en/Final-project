//무한 스크롤
function startMain(title){
    let isLoading = false;
    let page = 0;
    const size = 8; // 한 번에 로드할 아이템 수

    // 첫 페이지 로드
    function loadInitialProducts() {
        if (!isLoading) {
            isLoading = true;
            $.ajax({
                url: "allSearchProduct.ax",
                type: 'POST',
                data: {
                    page: page,
                    size: size,
                    title: title
                },
                beforeSend: function() {
                    isLoading = true;
                },
                success: function(response) {
                    appendProducts(response);
                    $('#load-more').show(); // 첫 로드 후 '더 보기' 버튼 표시
                    page++; // 페이지 번호 증가
                },
                error: function() {
                   console.log("무한 스크롤 실패");
                },
                complete: function() {
                    isLoading = false;
                }
            });
        }
    }

    // 추가 데이터 로드 함수
    function loadMoreProducts() {
        if (!isLoading && page > 0) { // 첫 페이지가 로드된 후에만 작동
            isLoading = true;
            $.ajax({
                url: "allSearchProduct.ax",
                type: 'POST',
                data: {
                    page: page,
                    size: size,
                    title: title
                },
                beforeSend: function() {
                    isLoading = true;
                },
                success: function(response) {
                    console.log("ajax 성공");
                    appendProducts(response);
                    if (!response.hasMore) { // 더 이상 불러올 데이터가 없으면 버튼 숨김
                        $('#load-more').hide();
                    } else {
                        page++; // 페이지 번호 증가
                    }
                },
                error: function() {
                    console.log("ajax 실패");
                },
                complete: function() {
                    isLoading = false;
                }
            });
        }
    }

    // 상품 데이터 DOM에 추가하는 함수
    function appendProducts(response) {
        let products = response.products;
        if (products.length > 0) {
            products.forEach(product => {
                console.log(product.averReviewDibs);
                const url = path + `/resources/image/star.png`;
                let productHTML = `
                    <div class="carousel-item" onclick="location.href='detail.spd?pno=${product.prNo}'">
                        <div class="product-descript">
                            <a href="sellersStore.st?sellerPageNo=${product.sellerPageNo}&order=1&cpage=1">
                                <p class="product-descript-store-name">${product.storeName}</p>
                            </a>
                            <p class="product-descript-product-name">${product.prTitle}</p>
                            <p class="product-descript-product-price">${product.prPrice}원</p>
                            <p class="product-descript-rating-review">
                                <img style="width: 13px;" src="${url}">
                                <span>${product.averReviewDibs}</span>
                                <span>리뷰</span>
                                <span>${product.reviewCount}</span>
                            </p>
                        </div>
                        <div class="carousel-dimg">
                            <img src="${product.prChangeName}">
                        </div>
                    </div>
                `;
                $('#all-product-carousel').append(productHTML);
            });
        }
    }

    // 이벤트 바인딩
    $('#load-more').click(loadMoreProducts);
    loadInitialProducts(); // 초기 데이터 로드
};
