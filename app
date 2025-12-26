<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dostoiévski: Labirintos da Alma</title>
  <style>
    :root {
      --bg-color: #0d0d0d;
      --paper-color: #e0d8c3; 
      --accent-color: #8b0000; /* Vermelho sangue seco */
    }

    body {
      margin: 0;
      padding: 0;
      background-color: var(--bg-color);
      color: var(--paper-color);
      font-family: 'Georgia', serif;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }

    /* Efeito de Névoa ao fundo */
    #fog-canvas {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
      opacity: 0.3;
    }

    .container {
      position: relative;
      z-index: 10;
      text-align: center;
      max-width: 650px;
      width: 90%;
    }

    .book-card {
      background: rgba(20, 20, 20, 0.9);
      border-left: 5px solid var(--accent-color);
      padding: 40px;
      box-shadow: 0 20px 50px rgba(0,0,0,0.8);
      min-height: 250px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      transition: all 0.5s ease;
    }

    h1 {
      font-size: 1.2rem;
      text-transform: uppercase;
      letter-spacing: 4px;
      color: var(--accent-color);
      margin-bottom: 30px;
      opacity: 0.8;
    }

    #quote-text {
      font-size: 1.5rem;
      line-height: 1.5;
      font-style: italic;
      margin-bottom: 20px;
    }

    #book-source {
      font-size: 0.9rem;
      text-transform: uppercase;
      letter-spacing: 2px;
      color: #666;
    }

    .btn-next {
      margin-top: 40px;
      padding: 12px 30px;
      background: transparent;
      border: 1px solid var(--paper-color);
      color: var(--paper-color);
      cursor: pointer;
      font-family: 'Courier New', Courier, monospace;
      text-transform: uppercase;
      transition: 0.3s;
    }

    .btn-next:hover {
      background: var(--paper-color);
      color: var(--bg-color);
    }

    .loading-line {
      width: 0%;
      height: 2px;
      background: var(--accent-color);
      margin: 20px auto;
      transition: width 0.5s;
    }
  </style>
</head>
<body>

<canvas id="fog-canvas"></canvas>

<div class="container">
  <h1>Fiódor Dostoiévski</h1>
  
  <div class="book-card" id="card">
    <div id="quote-text">"O segredo da existência humana não está apenas em viver, mas em saber para que se vive."</div>
    <div id="book-source">— Os Irmãos Karamazov</div>
  </div>

  <div class="loading-line" id="loader"></div>
  
  <button class="btn-next" onclick="proximaFrase()">Abrir outra página</button>
</div>

<script>
  // Frases reais dos livros de Dostoiévski
  const frases = [
    { text: "A maior felicidade é saber por que se é infeliz.", source: "O Adolescente" },
    { text: "O homem é um animal que se habitua a tudo.", source: "Recordações da Casa dos Mortos" },
    { text: "Se Deus não existe, tudo é permitido.", source: "Os Irmãos Karamazov" },
    { text: "É necessário ser um homem verdadeiramente grande para saber resistir até ao bom senso.", source: "O Idiota" },
    { text: "O sofrimento e a dor são sempre obrigatórios para uma consciência ampla e um coração profundo.", source: "Crime e Castigo" },
    { text: "A gente só gosta de contar os nossos problemas; não contamos as nossas alegrias.", source: "Noites Brancas" },
    { text: "Nada neste mundo é mais difícil do que dizer a verdade e nada é mais fácil do que a lisonja.", source: "O Idiota" },
    { text: "Eu digo que o mundo pode ir para o inferno, desde que eu possa sempre tomar o meu chá.", source: "Notas do Subterrâneo" },
    { text: "O amor é um mestre, mas é preciso saber conquistá-lo, pois se conquista dificilmente, custa caro, com muito trabalho e depois de muito tempo.", source: "Os Irmãos Karamazov" },
    { text: "Viver sem esperança é deixar de viver.", source: "Crime e Castigo" }
  ];

  function proximaFrase() {
    const card = document.getElementById('card');
    const loader = document.getElementById('loader');
    const textElem = document.getElementById('quote-text');
    const sourceElem = document.getElementById('book-source');

    // Feedback visual
    card.style.opacity = '0';
    card.style.transform = 'translateY(10px)';
    loader.style.width = '100%';

    setTimeout(() => {
      const sorteio = frases[Math.floor(Math.random() * frases.length)];
      textElem.innerText = `"${sorteio.text}"`;
      sourceElem.innerText = `— ${sorteio.source}`;
      
      card.style.opacity = '1';
      card.style.transform = 'translateY(0)';
      loader.style.width = '0%';
    }, 600);
  }

  // Efeito visual de névoa simples no canvas
  const canvas = document.getElementById('fog-canvas');
  const ctx = canvas.getContext('2d');
  let w, h;

  function resize() {
    w = canvas.width = window.innerWidth;
    h = canvas.height = window.innerHeight;
  }
  window.addEventListener('resize', resize);
  resize();

  function draw() {
    ctx.clearRect(0, 0, w, h);
    for (let i = 0; i < 20; i++) {
      ctx.beginPath();
      ctx.arc(Math.random() * w, Math.random() * h, Math.random() * 200, 0, Math.PI * 2);
      ctx.fillStyle = `rgba(50, 50, 50, 0.05)`;
      ctx.fill();
    }
    setTimeout(() => requestAnimationFrame(draw), 100);
  }
  draw();
</script>

</body>
</html>
