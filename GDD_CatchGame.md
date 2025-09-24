CATCH GAME - GAME DESIGN DOCUMENT (GDD)
========================================

VERSÃO: Alpha 1.0 FINAL
DATA: Setembro 2025
DESENVOLVEDOR: Igor Santos
PLATAFORMA: Windows Desktop
ENGINE: Godot 4.4.1

═══════════════════════════════════════════════════════════════

1. ESCOPO ATUAL DO JOGO

**CONCEITO GERAL:**
Catch Game é um jogo casual 2D onde o jogador controla um personagem que deve coletar objetos que caem do céu, evitando que toquem o chão. O objetivo é conseguir a maior pontuação possível antes de perder todas as vidas.

**ESCOPO ALPHA IMPLEMENTADO:**
✅ Sistema completo de gameplay funcional
✅ Menu principal com navegação completa
✅ Tela de instruções formatada
✅ Sistema de controles responsivo (teclado + mouse)
✅ Mecânica de spawn progressivo de coletáveis
✅ Sistema de colisão preciso (coleta + game over)
✅ Sistema de vidas (3 vidas iniciais)
✅ Sistema de pontuação em tempo real
✅ Progressão de dificuldade balanceada
✅ Sistema de pausa funcional
✅ Menus de pausa e game over com botões funcionais
✅ Loop completo de jogo estável
✅ Build executável para Windows

**GÊNERO:** Casual/Arcade
**PLATAFORMA:** PC Windows
**PÚBLICO-ALVO:** Jogadores casuais, todas as idades
**DURAÇÃO POR SESSÃO:** 2-5 minutos

═══════════════════════════════════════════════════════════════

2. VISÃO

**VISÃO DO PROJETO:**
"Criar um jogo simples, acessível e viciante que demonstre domínio completo dos fundamentos de game design e desenvolvimento técnico, servindo como base sólida para projetos mais complexos."

**OBJETIVOS DE DESIGN:**
- Proporcionar diversão imediata sem curva de aprendizado
- Criar um loop de jogo addictive baseado em skill progression
- Demonstrar implementação técnica sólida e profissional
- Entregar experiência polished dentro das limitações de tempo

**EXPERIÊNCIA DESEJADA:**
O jogador deve sentir que "só mais uma tentativa" após cada game over, motivado pela simplicidade dos controles e pela possibilidade sempre presente de superar seu recorde anterior.

═══════════════════════════════════════════════════════════════

2. PILARES DE DESIGN

2.1 ACESSIBILIDADE
- Controles simples (apenas 2 teclas de movimento)
- Interface intuitiva e clara
- Mecânicas fáceis de entender

2.2 PROGRESSÃO
- Dificuldade crescente natural
- Sistema de pontuação motivacional
- Feedback imediato das ações

2.3 REJOGAR
- Sessões rápidas
- Desafio de superar a pontuação anterior
- Game over que incentiva nova tentativa

═══════════════════════════════════════════════════════════════

3. PILARES DE DESIGN

**PILAR 1: SIMPLICIDADE ACESSÍVEL**
- Controles intuitivos: apenas 2 teclas de movimento (A/D ou setas)
- Interface limpa sem elementos que distraem
- Regras imediatamente compreensíveis
- Zero curva de aprendizado - jogador entende em segundos

**PILAR 2: PROGRESSÃO MOTIVACIONAL**
- Dificuldade crescente orgânica e bem balanceada
- Sistema de pontuação que recompensa consistência e habilidade
- Feedback visual e numérico imediato para todas as ações
- Sensação clara de improvement a cada tentativa

**PILAR 3: REJOGABILIDADE VICIANTE**
- Sessões curtas (2-5 min) perfeitas para qualquer momento
- "One more try" syndrome através de game over bem designed
- Desafio pessoal constante de superar o próprio recorde
- Simplicidade permite foco total na melhoria da skill

═══════════════════════════════════════════════════════════════

4. 3C (CHARACTER, CAMERA, CONTROLS)

**4.1 CHARACTER (Personagem)**
- **Representação Visual:** Retângulo verde simples (64x64px placeholder)
- **Movimento:** Apenas horizontal (esquerda/direita)
- **Física:** CharacterBody2D com movimento suave e responsivo
- **Velocidade:** 300 pixels/segundo com aceleração natural
- **Limitações:** Confinado às bordas da tela (não pode sair)
- **Feedback:** Movimento imediato ao input, sem delay perceptível

**4.2 CAMERA**
- **Tipo:** Estática, visão 2D top-down
- **Resolução:** 800x600 pixels (4:3 aspect ratio)
- **Posicionamento:** Centralizada, sem movimentação
- **Zoom:** Fixo, sem alterações durante gameplay
- **Enquadramento:** Tela completa visível o tempo todo

**4.3 CONTROLS (Controles)**
- **Movimento:**
  - A / Seta Esquerda → Mover para esquerda
  - D / Seta Direita → Mover para direita
- **Sistema:**
  - ESC → Pausar jogo / Voltar nos menus
  - Mouse → Navegação em todos os menus e botões
- **Responsividade:** Input lag zero, resposta imediata
- **Acessibilidade:** Funciona com teclado QWERTY e ABNT2

═══════════════════════════════════════════════════════════════

5. LOOPS DE JOGO

**5.1 MICRO LOOP (Core Gameplay)**
Duração: 1-3 segundos por ciclo
```
1. Objeto spawn no topo da tela (posição X aleatória)
2. Jogador observa trajetória e posiciona personagem
3. Objeto desce em linha reta com velocidade constante
4. DECISÃO: Jogador move para interceptar OU evita para preservar vida
5. RESULTADO A: Colisão = +1 ponto + objeto destruído
6. RESULTADO B: Objeto toca o chão = -1 vida + feedback visual
7. LOOP: Retorna ao passo 1 com timer reduzido
```

**5.2 MACRO LOOP (Sessão Completa)**
Duração: 2-5 minutos por sessão
```
1. Menu Principal → Jogador escolhe "JOGAR"
2. Jogo inicia com 3 vidas e score 0
3. MICRO LOOPS se repetem com dificuldade crescente
4. Jogador perde todas as vidas → GAME OVER
5. Tela de Game Over mostra score final
6. DECISÃO: "JOGAR NOVAMENTE" OU "MENU PRINCIPAL"
7. LOOP: Retorna ao passo 1 ou 2
```

**5.3 META LOOP (Progressão de Skill)**
Duração: Múltiplas sessões
```
1. Primeira sessão: jogador aprende mecânicas básicas
2. Sessões seguintes: jogador tenta superar recorde anterior  
3. Skill improvement: reação mais rápida, posicionamento melhor
4. Motivação: "consegui 15 pontos, agora vou tentar 20"
5. LOOP: Continuous improvement mindset
```

═══════════════════════════════════════════════════════════════

7. MECÂNICAS ENTREGUES NO ALPHA

**7.1 MECÂNICAS CORE (100% Funcionais)**

✅ **Sistema de Movimento do Jogador**
- CharacterBody2D com physics suave e responsiva
- Velocidade constante de 300px/s em ambas direções
- Boundingbox que impede saída da tela
- Input handling para A/D e setas direcionais

✅ **Sistema de Spawn de Coletáveis**
- Timer automático que diminui conforme progressão
- Posição X aleatória no topo da tela (com margens)
- Velocidade de descida constante e previsível
- Instanciação e destruição automática de objetos

✅ **Sistema de Colisão e Coleta**
- Area2D detection entre player e collectibles
- Destruição imediata do objeto coletado
- Incremento instantâneo da pontuação (+1)
- Feedback visual através da remoção do objeto

✅ **Sistema de Vidas e Game Over**
- VisibleOnScreenNotifier2D para detecção de objetos perdidos
- Sistema de 3 vidas iniciais com decremento
- Game over automático quando vidas = 0
- Transição suave para tela de game over

✅ **Sistema de UI e Interface**
- Display em tempo real de Score (canto superior esquerdo)
- Display em tempo real de Vidas (canto superior direito)
- Menu principal funcional com botões responsivos
- Sistema de pausa com get_tree().paused
- Menus de pausa e game over totalmente funcionais

**7.2 SISTEMAS AUXILIARES (100% Funcionais)**

✅ **Sistema de Navegação**
- Transições entre cenas sem bugs ou crashes
- Botões funcionais em todos os menus
- ESC key handling em todos os contextos
- Mouse interaction em toda interface

✅ **Sistema de Pause**
- get_tree().paused implementation correta
- Process_mode hierarchy bem configurada
- Menu de pause overlay com botões funcionais
- Resume e return to main menu working

✅ **Sistema de Instructions**
- BBCode formatting para texto estruturado
- Layout responsivo e legível
- Informações completas sobre controles e objetivos

═══════════════════════════════════════════════════════════════

6. PROGRESSÃO

**6.1 CURVA DE DIFICULDADE**
- **Início:** Spawn timer = 2.0 segundos (ritmo relaxado)
- **Progressão:** Cada objeto coletado reduz timer em 5%
- **Limite Mínimo:** 0.5 segundos (máxima dificuldade)
- **Balanceamento:** 30+ objetos para atingir dificuldade máxima

**6.2 TIPOS DE PROGRESSÃO**

**Progressão de Dificuldade:**
- Score 0-5: Spawn lento, jogador aprende
- Score 6-15: Ritmo moderado, requer atenção
- Score 16-30: Ritmo rápido, requer skill
- Score 30+: Dificuldade máxima, teste de maestria

**Progressão de Skill do Jogador:**
- **Iniciante:** Foca em não perder vidas
- **Intermediário:** Optimiza movimento para coletar mais
- **Avançado:** Antecipa spawns e planeja rotas
- **Expert:** Maximiza efficiency para high scores

**Progressão Visual:**
- Score aumenta em tempo real (feedback constante)
- Vidas diminuem visualmente quando perdidas
- Sem outros indicadores visuais de progressão (mantém simplicidade)

**6.3 MOTIVAÇÃO PARA CONTINUAR**
- **Milestone psicológico:** Números redondos (10, 20, 50 pontos)
- **Personal best:** Sempre visível na tela de game over
- **Improvement feedback:** "Melhorou 3 pontos da última vez"
- **Acessibilidade:** Qualquer score é uma conquista válida

═══════════════════════════════════════════════════════════════

7. INTERFACE DE USUÁRIO (UI)

7.1 MENU PRINCIPAL:
- Logo/Título do jogo
- Botão "JOGAR"
- Botão "INSTRUÇÕES"
- Botão "SAIR"
- Nota: "ESC - Sair do jogo"

7.2 TELA DE INSTRUÇÕES:
- Explicação do objetivo
- Lista de controles
- Regras básicas
- Botão "VOLTAR"

7.3 HUD IN-GAME:
- Score (canto superior esquerdo)
- Vidas (canto superior direito)
- Clean, não intrusivo

7.4 TELA DE PAUSA:
- Overlay escuro semitransparente
- "PAUSADO"
- Botão "CONTINUAR"
- Botão "MENU PRINCIPAL"

7.5 TELA DE GAME OVER:
- "GAME OVER"
- Pontuação final
- Botão "JOGAR NOVAMENTE"
- Botão "MENU PRINCIPAL"

═══════════════════════════════════════════════════════════════

8. ARTE E ASSETS (ALPHA)

8.1 ESTILO VISUAL:
- Placeholder art (formas geométricas simples)
- Paleta de cores básica
- Estilo minimalista

8.2 ASSETS ATUAIS:
- Jogador: Retângulo verde (64x64px)
- Coletáveis: Círculos dourados (48x48px)
- Background: Gradiente azul simples
- UI: Texto branco sobre fundos coloridos

8.3 ASSETS PLANEJADOS (versões futuras):
- Sprites animados para personagem
- Sprites variados para coletáveis
- Background mais detalhado
- Efeitos de partículas
- Ícones para UI

═══════════════════════════════════════════════════════════════

9. ÁUDIO (PLACEHOLDER)

9.1 STATUS ATUAL:
- Sem áudio implementado no alpha
- Usando audio placeholder/silence

9.2 PLANEJADO PARA VERSÕES FUTURAS:
- SFX de coleta
- SFX de perda de vida
- Música de fundo (loop)
- SFX de UI (botões, transições)

═══════════════════════════════════════════════════════════════

10. FEATURES IMPLEMENTADAS (ALPHA FINAL)

✓ Menu principal funcional com navegação completa
✓ Tela de instruções com BBCode formatado
✓ Controles responsivos (A/D, setas, ESC, mouse)
✓ Sistema de spawning automático progressivo
✓ Detecção de colisão perfeita (coleta e game over)
✓ Sistema de vidas completo (3 vidas, feedback visual)
✓ Sistema de pontuação com display em tempo real
✓ Progressão de dificuldade balanceada
✓ Tela de game over com pontuação final
✓ Sistema de pausa funcional com get_tree().paused
✓ Menu de pausa com botões funcionais
✓ Menu de game over com botões funcionais
✓ Process_mode configurado corretamente para UI
✓ Loop completo de jogo sem bugs
✓ Transições entre cenas estáveis
✓ Export configurado para Windows
✓ Build executável testado e funcional
✓ Código limpo sem duplicações ou erros
✓ Documentação completa atualizada

═══════════════════════════════════════════════════════════════

8. CONTEÚDO ADIADO

**8.1 FEATURES CORTADAS PARA FOCAR NO ALPHA**

🚫 **Sistema de Áudio**
- **Planejado:** SFX de coleta, perda de vida, música de fundo
- **Motivo do corte:** Foco em funcionalidade core e limitação de tempo
- **Prioridade futura:** Alta (melhora significativamente a experiência)

🚫 **Arte e Animações Avançadas**
- **Planejado:** Sprites animados, backgrounds detalhados, efeitos de partículas
- **Motivo do corte:** Placeholder art permite focar na programação
- **Prioridade futura:** Média (functional over beautiful para alpha)

🚫 **Múltiplos Tipos de Coletáveis**
- **Planejado:** Power-ups, objetos com valores diferentes, items especiais
- **Motivo do corte:** Adiciona complexidade desnecessária no alpha
- **Prioridade futura:** Alta (aumentaria significativamente o replay value)

🚫 **Sistema de High Score Persistente**
- **Planejado:** Salvamento de recordes, leaderboard local
- **Motivo do corte:** Requer sistema de save/load adicional
- **Prioridade futura:** Média (nice to have, mas não essencial)

🚫 **Múltiplos Backgrounds/Cenários**
- **Planejado:** Diferentes ambientes visuais, mudança de cenário por score
- **Motivo do corte:** Visual polish não prioritário para funcionalidade alpha
- **Prioridade futura:** Baixa (cosmético apenas)

**8.2 RAZÕES ESTRATÉGICAS DOS CORTES**

**Foco em Core Gameplay:**
- Priorizar um loop de jogo sólido e bem testado
- Garantir zero bugs críticos na experiência principal
- Demonstrar competência técnica fundamental

**Limitações de Tempo Acadêmico:**
- Deadline de entrega definido (26/09/2025)
- Necessidade de documentação completa além do código
- Tempo dedicado a debug e polish das features core

**Filosofia "Less is More":**
- Um jogo simples e perfeito > jogo complexo com bugs
- Features que realmente adicionam valor vs features "legais"
- Sustainable development scope para um desenvolvedor solo

**8.3 ROADMAP PÓS-ALPHA**

**Versão Beta (hipotética):**
1. Implementar sistema de áudio completo
2. Adicionar 2-3 tipos diferentes de coletáveis
3. Melhorar arte visual (sprites customizados)
4. Sistema de high score persistente

**Versão Release (hipotética):**
1. Multiple game modes (time attack, survival)
2. Power-ups e mechanics especiais
3. Backgrounds dinâmicos e efeitos visuais
4. Balanceamento fino baseado em playtesting

═══════════════════════════════════════════════════════════════

12. ESPECIFICAÇÕES TÉCNICAS

12.1 ENGINE: Godot 4.4.1 stable
12.2 LINGUAGEM: GDScript
12.3 RESOLUÇÃO: 800x600 (configurável)
12.4 FRAMERATE: 60 FPS target
12.5 ARQUITETURA:
- Node2D principal (Main) com process_mode = 1
- CharacterBody2D para jogador (movement suave)
- Area2D para coletáveis (sem física desnecessária)
- CanvasLayer para UI com process_mode = 2
- Timer para spawn management
- get_tree().paused para sistema de pausa real

12.6 ESTRUTURA DE SCENES:
- MainMenu.tscn (entrada do jogo com navegação)
- Main.tscn (gameplay principal com pause system)
- Instructions.tscn (tutorial com BBCode formatado)
- Player.tscn (jogador com Area2D collision)
- Collectible.tscn (objetos com VisibleOnScreenNotifier2D)
- UI.tscn (interface com menus de pause e game over)

12.7 SISTEMAS AVANÇADOS:
- Process_mode hierarchy para pause functionality
- Signal-based communication entre cenas
- Proper scene management e memory cleanup
- Input mapping configurável
- Export presets otimizados para Windows

═══════════════════════════════════════════════════════════════

13. NEXT STEPS (Pós-Alpha)

13.1 BETA PRIORITIES:
1. Implementar sistema de áudio
2. Melhorar arte visual
3. Adicionar power-ups
4. Sistema de high score

13.2 RELEASE PRIORITIES:
1. Polish visual completo
2. Múltiplos tipos de objetos
3. Diferentes backgrounds
4. Balanceamento fino de dificuldade

═══════════════════════════════════════════════════════════════

14. QUALIDADE E ENTREGA FINAL

14.1 BUGS CORRIGIDOS:
- ✅ Player invisibility (ColorRect layout issues)
- ✅ Coletáveis pushing player (physics conflicts)  
- ✅ UI file corruption (syntax errors)
- ✅ Pause menu buttons não funcionais
- ✅ Game over buttons não funcionais
- ✅ Process_mode hierarchy implementation
- ✅ Manual pause system replaced with get_tree().paused
- ✅ BBCode formatting issues nas instruções
- ✅ Code duplication e funções inexistentes

14.2 TESTES REALIZADOS:
- ✅ Full gameplay loop (múltiplas execuções)
- ✅ All button functionality (menus, pause, game over)
- ✅ ESC key behavior em todos os estados
- ✅ Score system accuracy e display
- ✅ Lives system proper functioning
- ✅ Difficulty progression balancing  
- ✅ Scene transitions stability
- ✅ Windows build functionality
- ✅ Memory management (no leaks detectados)

14.3 QUALIDADE FINAL:
- **Estabilidade**: ALTA (zero crashes conhecidos)
- **Jogabilidade**: COMPLETA (todos sistemas funcionais)
- **Usabilidade**: EXCELENTE (controles intuitivos)
- **Performance**: OTIMIZADA (60 FPS estável)
- **Código**: LIMPO (sem duplicações ou dead code)
- **Documentação**: COMPLETA (GDD, README, instruções)

14.4 ENTREGÁVEIS FINAIS:
✅ Executável Windows (.exe + .pck)
✅ Código fonte completo e organizado
✅ Game Design Document atualizado
✅ README com instruções de uso
✅ BUILD_INSTRUCTIONS para reprodução
✅ PLANEJAMENTO com análise do desenvolvimento
✅ Export presets configurados

═══════════════════════════════════════════════════════════════

FIM DO DOCUMENTO GDD
Status: ALPHA COMPLETO E FUNCIONAL
Versão: 1.0
Data: Setembro 2025
Desenvolvedor: Igor Santos

DOCUMENTO REORGANIZADO SEGUINDO ESPECIFICAÇÕES DO PROFESSOR:
✅ Escopo atual do jogo
✅ Visão  
✅ Pilares
✅ 3C (Character/Camera/Controls)
✅ Loops
✅ Progressão
✅ Mecânicas entregues no alpha
✅ Conteúdo adiado
Versão: 1.0 Alpha
Última atualização: Setembro 2025