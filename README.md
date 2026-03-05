# Flugo Chat — Desafio Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

Sistema de chat em tempo real desenvolvido como solução para o Desafio Técnico Flutter da Flugo.

---

## ✅ Requisitos do Desafio

| Requisito | Status |
| :--- | :---: |
| Firebase Authentication (login e cadastro) | ✅ |
| Chat em tempo real com Firebase Realtime Database | ✅ |
| Mensagens com texto, nome do usuário e horário | ✅ |
| Mensagens carregadas em ordem cronológica | ✅ |
| Atualização automática ao receber novas mensagens | ✅ |
| Diferenciação visual entre mensagens próprias e de outros | ✅ |
| Scroll automático para a última mensagem | ✅ |
| Campo de texto e botão de envio funcionais | ✅ |
| Arquitetura modular e separação de responsabilidades | ✅ |

---

## 🌟 Diferenciais Implementados

- 🎨 **Design consistente** — identidade visual alinhada com a marca Flugo (cor primária `#20C975`)
- 📱 **Responsivo** — layout adaptado para diferentes tamanhos de tela
- 🔄 **Estado de loading** — indicador visual durante autenticação
- ✉️ **Envio por Enter** — suporte a `TextInputAction.send` além do botão
- 🚪 **Logout** — botão de saída centralizado no AppBar

---

## 🛠️ Stack e Arquitetura

| Tecnologia | Decisão |
| :--- | :--- |
| **Flutter Web** | Framework principal para desenvolvimento cross-platform |
| **Firebase Auth** | Autenticação com email e senha |
| **Firebase Realtime Database** | Persistência e sincronização de mensagens em tempo real |
| **Firebase Hosting** | Deploy e distribuição do app web |

### 📁 Estrutura do Projeto

```
lib/
├── main.dart                  # Inicialização do Firebase
├── app.dart                   # Roteamento baseado em estado de autenticação
├── firebase_options.dart      # Configuração gerada pelo FlutterFire CLI
├── models/
│   └── message_model.dart     # Modelo de dados da mensagem
├── services/
│   ├── auth_service.dart      # Lógica de autenticação
│   └── chat_service.dart      # Lógica de mensagens (envio e stream)
├── screens/
│   ├── login_screen.dart      # Tela de login e cadastro
│   └── chat_screen.dart       # Tela principal do chat
└── widgets/
    ├── message_bubble.dart    # Componente de bolha de mensagem
    └── message_input.dart     # Componente de campo de texto e envio
```

---

## 🔗 Deploy

**https://flugo-challenge-66dea.web.app**

**Acesso de teste:**
- Login: `flugo@flugo.com`
- Senha: `123456`

---

## ⚙️ Como rodar localmente

**1. Clone o repositório**
```bash
git clone https://github.com/GabrielCaetanoo/flugo-chat.git
cd flugo-chat
```

**2. Instale as dependências**
```bash
flutter pub get
```

**3. Execute o projeto**
```bash
flutter run -d chrome
```

---

## 👨‍💻 Autor

**Gabriel Caetano da Costa**

📍 Maringá — PR &nbsp;|&nbsp; 🎓 Engenharia de Software — Unicesumar &nbsp;|&nbsp; 💼 Assistente Financeiro em Construtora

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/gabriel-caetano-7a454b149)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/GabrielCaetanoo)
