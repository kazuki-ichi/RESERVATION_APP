document.addEventListener('turbolinks:load', () => {
    var checkInDateInput = document.getElementById('check-in-date');
    var checkOutDateInput = document.getElementById('check-out-date');

    if (!checkInDateInput || !checkOutDateInput) {
        return;
    }
    // 今日の日付を取得
    const today = new Date();

    // 年月日を取得
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');

    // 日付を設定（yyyy-mm-dd形式）
    const todayDate = `${year}-${month}-${day}`;

    // input要素の値を設定
    checkInDateInput.value = todayDate;
    checkOutDateInput.min = checkInDateInput.value;

    checkInDateInput.addEventListener('input', function() {
        checkOutDateInput.min = checkInDateInput.value;
    });

  })