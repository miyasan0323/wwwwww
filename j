const player = document.getElementById('player');
const enemy = document.getElementById('enemy');
let playerPos = { x: 180, y: 180 };

function movePlayer(direction) {
    switch(direction) {
        case 'left':
            if (playerPos.x > 0) playerPos.x -= 20;
            break;
        case 'up':
            if (playerPos.y > 0) playerPos.y -= 20;
            break;
        case 'down':
            if (playerPos.y < 380) playerPos.y += 20;
            break;
        case 'right':
            if (playerPos.x < 380) playerPos.x += 20;
            break;
    }
    player.style.left = playerPos.x + 'px';
    player.style.top = playerPos.y + 'px';
    checkCollision();
}

function checkCollision() {
    const playerRect = player.getBoundingClientRect();
    const enemyRect = enemy.getBoundingClientRect();

    if (
        playerRect.x < enemyRect.x + enemyRect.width &&
        playerRect.x + playerRect.width > enemyRect.x &&
        playerRect.y < enemyRect.y + enemyRect.height &&
        playerRect.y + playerRect.height > enemyRect.y
    ) {
        alert('敵とぶつかった！ゲームオーバー！');
        playerPos = { x: 180, y: 180 };
        player.style.left = playerPos.x + 'px';
        player.style.top = playerPos.y + 'px';
    }
}
