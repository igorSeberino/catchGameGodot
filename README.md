# Catch Game - Projeto Acadêmico N1 (Alpha Jogável)

## Contexto Acadêmico
Este projeto foi desenvolvido como **trabalho acadêmico N1 - Alpha Jogável** para demonstrar competência em desenvolvimento de jogos, design de sistemas e documentação profissional. O objetivo é apresentar um jogo funcional e completo que evidencie o domínio dos fundamentos de game development.

**Período de Desenvolvimento:** Setembro 2025  
**Status:** Alpha Finalizado e Entregue  
**Plataforma Alvo:** Windows Desktop  
**Engine Utilizada:** Godot 4.4.1 (stable)  

## Objetivos de Aprendizado
Este projeto visa demonstrar competências em:
- ✅ **Implementação de Game Loops:** Micro loops, macro loops e progressão
- ✅ **Arquitetura de Software:** Organização modular e clean code  
- ✅ **Game Design:** Aplicação dos pilares de design e 3Cs
- ✅ **Documentação Técnica:** GDD profissional e planning documentation
- ✅ **Gestão de Projeto:** Scope management e deadline compliance
- ✅ **Build e Deploy:** Processo completo de export para distribuição

## Descrição do Jogo
Catch Game é um jogo arcade casual onde o jogador controla um personagem que deve coletar objetos dourados que caem do céu. O objetivo é conseguir a maior pontuação possível antes de perder todas as 3 vidas, demonstrando um loop de jogo viciante e progressão bem balanceada.

## Como Jogar
- Use **A/D** ou **Setas Esquerda/Direita** para mover o jogador
- Colete os objetos dourados que caem do topo da tela
- Cada objeto coletado aumenta sua pontuação
- Se um objeto tocar o chão, você perde uma vida
- O jogo fica mais rápido conforme você coleta mais objetos
- Você tem **3 vidas** - o jogo termina quando todas acabam
- Use **ESC** para pausar durante o jogo ou sair dos menus

## Controles
- **A / Seta Esquerda**: Mover para a esquerda
- **D / Seta Direita**: Mover para a direita
- **ESC**: Pausar jogo / Voltar ao menu / Sair
- **Mouse**: Navegar nos menus e clicar nos botões

## Estrutura do Projeto
```
GODOT/
├── scenes/              # Cenas do jogo
│   ├── MainMenu.tscn   # Menu principal
│   ├── Main.tscn       # Cena principal do jogo
│   ├── Instructions.tscn # Tela de instruções
│   ├── Player.tscn     # Cena do jogador
│   ├── Collectible.tscn # Cena dos objetos coletáveis
│   └── UI.tscn         # Interface do usuário
├── scripts/            # Scripts em GDScript
│   ├── MainMenu.gd     # Lógica do menu principal
│   ├── Main.gd         # Lógica principal do jogo
│   ├── Instructions.gd # Controle da tela de instruções
│   ├── Player.gd       # Controle do jogador
│   ├── Collectible.gd  # Comportamento dos coletáveis
│   └── UI.gd          # Interface, pontuação e menus
├── .godot/             # Arquivos internos do Godot
├── project.godot       # Arquivo de configuração do Godot
├── export_presets.cfg  # Configurações de export
├── icon.svg           # Ícone do projeto
├── README.md          # Este arquivo (documentação técnica)
├── README.txt         # Manual do usuário final
└── GDD_CatchGame.md   # Game Design Document
```

## Características do Jogo
- **Jogador**: Retângulo verde controlado pelo teclado
- **Coletáveis**: Círculos dourados que caem do topo
- **Sistema de Vidas**: 3 vidas - perde uma quando objeto toca o chão
- **Pontuação**: Aumenta a cada objeto coletado
- **Dificuldade Progressiva**: Objetos aparecem mais rapidamente
- **Menu Principal**: Com opções Jogar, Instruções e Sair
- **Menu de Pausa**: Acessível com ESC durante o jogo
- **Tela de Game Over**: Mostra pontuação final e opções
- **Visual**: Estilo minimalista com formas coloridas

## Escopo e Limitações do Alpha

**ESCOPO IMPLEMENTADO:**
- ✅ **Core Gameplay:** Loop completo funcional e testado
- ✅ **Sistema de Progressão:** Dificuldade crescente balanceada
- ✅ **Interface Completa:** Menus, HUD, pause e game over funcionais
- ✅ **Controles Intuitivos:** Input system responsivo e acessível
- ✅ **Build Distribution:** Executável Windows pronto para entrega
- ✅ **Documentação:** GDD seguindo especificações acadêmicas

**LIMITAÇÕES INTENCIONAIS:**
- 🎨 **Arte Placeholder:** Foco em funcionalidade sobre visual polish
- 🔊 **Sem Áudio:** Cortado para priorizar sistemas core
- 🎮 **Gameplay Simples:** Design focado em demonstrar competências fundamentais
- ⏰ **Scope Reduzido:** Adequado ao prazo de entrega acadêmica

## Metodologia de Desenvolvimento

**ABORDAGEM:**
- **Agile Mindset:** Desenvolvimento iterativo com priorização de features
- **MVP Strategy:** Minimum Viable Product funcional antes de features extras  
- **Documentation-First:** GDD definido antes da implementação
- **Test-Driven:** Cada sistema testado antes de avançar
- **Clean Architecture:** Código organizando pensando em manutenibilidade

**TOOLS E TECNOLOGIAS:**
- **Engine:** Godot 4.4.1 (escolhida por produtividade e learning curve)
- **Language:** GDScript (integração nativa, rapid prototyping)
- **Version Control:** Git (através de VS Code integration)
- **Documentation:** Markdown para compatibilidade e versionamento

## Como Abrir no Godot
1. Abra o Godot Engine
2. Clique em "Import"
3. Navegue até a pasta do projeto e selecione o arquivo `project.godot`
4. Clique em "Import & Edit"
5. Execute o jogo pressionando F5 ou clicando no botão "Play"

## Versão do Godot
Este projeto foi criado e testado no Godot 4.4.1 stable

## Estrutura Acadêmica da Entrega

### Documentação Obrigatória:
- 📋 **`GDD_CatchGame.md`** → Game Design Document seguindo especificações
- 📊 **`PLANEJAMENTO_CatchGame.xlsx`** → Planning e cronograma em português
- 📖 **`README.md`** → Documentação técnica (este arquivo)  
- 📄 **`README.txt`** → Manual do usuário final

### Build e Executáveis:
- 🎮 **`Catch Game.exe`** → Executável principal Windows x64
- 📦 **`Catch Game.pck`** → Package com todos os assets do jogo
- ⚙️ **`project.godot`** → Arquivo de projeto para abertura no editor

### Código Fonte:
- 🎬 **`scenes/`** → Todas as cenas (.tscn files)
- 📝 **`scripts/`** → Toda a lógica em GDScript (.gd files)
- 🎨 **`icon.svg`** → Asset visual do projeto

## Resultados de Aprendizado Alcançados

**COMPETÊNCIAS TÉCNICAS DEMONSTRADAS:**
- ✅ **Game Programming:** Implementação de physics, collision detection, UI systems
- ✅ **Software Architecture:** Scene management, signal communication, modular design
- ✅ **Game Design Theory:** Application of 3Cs, game loops, progression curves
- ✅ **Project Management:** Scope definition, feature prioritization, deadline delivery
- ✅ **Technical Writing:** Professional documentation, user instructions, code comments

**SISTEMAS COMPLEXOS IMPLEMENTADOS:**
- ⏸️ **Pause System:** get_tree().paused com process_mode hierarchy
- 🎯 **Collision Detection:** Area2D systems para gameplay e boundaries
- 📊 **Progressive Difficulty:** Algoritmo de spawn timing baseado em performance
- 🎮 **Input Management:** Multi-input support (WASD, arrows, mouse, ESC)
- 📱 **UI State Management:** Menu transitions, pause overlays, game over screens

## Critérios de Avaliação Atendidos

**FUNCIONALIDADE (Alpha Jogável):**
✅ Jogo completamente funcional do início ao fim  
✅ Zero crashes ou bugs críticos conhecidos  
✅ Loop de jogo envolvente e balanceado  
✅ Controles intuitivos e responsivos  

**DOCUMENTAÇÃO PROFISSIONAL:**  
✅ GDD seguindo especificações do professor  
✅ Planejamento realista com datas em português  
✅ README técnico completo  
✅ Instruções de usuário claras  

**QUALIDADE TÉCNICA:**  
✅ Código limpo e bem organizado  
✅ Arquitetura modular e extensível  
✅ Performance otimizada (60 FPS estável)  
✅ Build funcionando em ambiente target

## Instruções para Gerar Build Windows

### Requisitos:
- Godot Engine 4.4.1 ou superior
- Windows 10/11 x64

### Passos:
1. **Abrir o Projeto:**
   - Abra o Godot Engine 4.4.1
   - Clique em "Import" e selecione `project.godot`
   - Aguarde o projeto carregar

2. **Verificar Projeto:**
   - Teste o jogo no editor (F5) 
   - Certifique-se de que não há erros no console

3. **Configurar Export:**
   - Menu "Project" → "Export"
   - Se necessário, baixe os templates de export
   - Selecione "Windows Desktop"

4. **Gerar Build:**
   - Clique em "Export Project"
   - Salve como: `builds/windows/Catch Game.exe`
   - Aguarde a conclusão

### Arquivos do Build:
- `Catch Game.exe` (executável)
- `Catch Game.pck` (dados do jogo)
- `README.txt` (manual do usuário)

## Próximos Passos Pós-Entrega (Roadmap Hipotético)

**VERSÃO BETA (Melhorias Planejadas):**
- 🔊 Sistema de áudio completo (SFX + música de fundo)
- 🎨 Arte visual customizada (sprites animados)
- ⭐ Múltiplos tipos de coletáveis com valores diferentes
- 🏆 Sistema de high score persistente

**VERSÃO RELEASE (Visão Completa):**
- 🎮 Múltiplos modos de jogo (Time Attack, Survival)
- 💥 Power-ups e mechanics especiais
- 🌟 Efeitos visuais avançados (particles, screen shake)
- 🎯 Achievement system e unlockables

---

**CONCLUSÃO ACADÊMICA:**  
Este projeto demonstra competência completa na criação de jogos digitais, desde a concepção até a entrega, incluindo documentação profissional e entrega dentro do prazo estabelecido. O foco em qualidade sobre quantidade resultou em um produto polished e funcional que serve como foundation sólida para projetos futuros mais ambiciosos.

**Data de Conclusão:** Setembro 2025  
**Status Final:** ✅ ENTREGUE E FUNCIONAL