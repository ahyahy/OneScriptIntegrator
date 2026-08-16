if (localStorage['keybt0hutbo'] == 'true') {
	document.body.setAttribute('style',
		'font-size: 35px !important;' +
		''
	);
	
	let elems = document.querySelectorAll("div#nsbanner");
	for (elem of elems) {
		elem.setAttribute('style',
			'height: 60px;' +
			''
		);
	}
}
else {
	document.body.setAttribute('style',
		'font-size: 16px !important' +
		''
	);
}

// ================================
function divrightClick(e) {
	if (e.target.nodeName == 'A') {
		localStorage["destination"] = '' + e.target;
	}
}

document.addEventListener('DOMContentLoaded', function (event) {
	localStorage["destination"] = '' + document.location;
});
// ================================
// // Функции копирования примеров.
// window.onload = function () {
	// var a = document.getElementById('copy1');
	// a.onclick = function () {
		// window.getSelection().removeAllRanges();
		// var range1 = document.createRange();
		// range1.selectNode(document.getElementById('cont1'));
		// try {
			// navigator.clipboard.writeText(range1);
		// } catch (err) { }
		// window.getSelection().removeRange(range1);
		// return false;
	// }

	// var b = document.getElementById('copy2');
	// b.onclick = function () {
		// window.getSelection().removeAllRanges();
		// var range2 = document.createRange();
		// range2.selectNode(document.getElementById('cont2'));
		// try {
			// navigator.clipboard.writeText(range2);
		// } catch (err) { }
		// window.getSelection().removeRange(range2);
		// return false;
	// }
// }
// ================================
// // Функция копирования примеров.
document.addEventListener('DOMContentLoaded', function () {
    // Используем делегирование: вешаем один клик на все окно документа
    document.body.addEventListener('click', function(event) {
        // Проверяем, что кликнули именно по кнопке с нужным классом
        if (event.target.classList.contains('copy-btn')) {
            event.preventDefault(); // Отменяем стандартное поведение button внутри details
            const button = event.target;
            // Читаем из data-атрибута, какой именно div нам нужен
            const targetId = button.getAttribute('data-target-id'); 
            // Находим нужный элемент с кодом
            const codeBlock = document.getElementById(targetId);
            if (!codeBlock) return;
            // Создаем временный невидимый textarea для браузера
            const textArea = document.createElement("textarea");
            // Получаем текст
            textArea.value = codeBlock.innerText;
            // Стилизуем его, чтобы он был вне экрана
            textArea.style.position = "fixed"; 
            textArea.style.top = "-9999px";
            document.body.appendChild(textArea);
            textArea.focus();
            textArea.select();
            let successful = false;
            try {
                // Современный API
                successful = navigator.clipboard.writeText(textArea.value);
            } catch (err) {
                // Fallback для старых браузеров
                successful = document.execCommand('copy');
            }
            document.body.removeChild(textArea);
            // Опционально: визуальная обратная связь
            const originalText = button.textContent;
            if (successful) {
                button.textContent = 'Скопировано!';
                setTimeout(() => button.textContent = originalText, 1500); // Вернуть текст через 1.5 сек
            } else {
                alert('Не удалось скопировать текст.');
            }
        }
    });
});
// ================================

// === Начало для масштабирования ==========
function clickimg(e) {
	var img01 = e.target;
	let tail = img01.id.replace("myImg", "");
	var modal01 = document.getElementById('myModal' + tail);
	var modalImg01 = document.getElementById('img' + tail);

	modal01.style.display = "block";
	modalImg01.src = img01.src;

	var span01 = document.getElementById('close' + tail);
	span01.onclick = function () {
		modal01.style.display = "none";
	}
}
// === Конец для масштабирования ==========