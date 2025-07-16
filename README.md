# FitMirror AI - Frontend 🏋️‍♂️✨

Aplicación web para análisis de postura en tiempo real usando IA. Proyecto desarrollado con React + Vite y TailwindCSS.

## 🚀 Tecnologías
- **Frontend**: React 18 + Vite
- **Estilos**: TailwindCSS + CSS Modules
- **Animaciones**: Framer Motion
- **Routing**: React Router v6
- **HTTP Client**: Axios
- **Iconos**: React Icons

## 📦 Instalación
1. Clona el repositorio:
```bash
git clone https://github.com/cayrolss/FitMirror-AI-Frontend.git
Instala dependencias:

bash
npm install
Configura variables de entorno:

bash
cp .env.example .env
Inicia la app:

bash
npm run dev
🏗️ Estructura del Proyecto
bash
src/
├── assets/           # Assets estáticos
├── components/       # Componentes reutilizables
│   ├── Camera/       # Lógica de captura de video
│   ├── UI/           # Botones, tarjetas, etc.
├── hooks/            # Custom hooks
├── pages/            # Vistas principales
├── services/         # Conexión con APIs
├── styles/           # Estilos globales
├── utils/            # Funciones utilitarias
└── App.jsx           # Configuración principal
🔍 Componentes Clave
CameraCapture
jsx
<CameraCapture 
  onAnalysisComplete={(data) => setResults(data)}
  postureThreshold={0.8}
/>
Props:

onAnalysisComplete: Callback con resultados de IA

postureThreshold: Sensibilidad de detección (0-1)

PostureFeedback
Visualiza resultados del análisis con:

Gráficos animados

Recomendaciones personalizadas

🌐 Variables de Entorno
env
VITE_API_URL=https://api.fitmirror.ai/v1
VITE_GOOGLE_ANALYTICS_ID=UA-XXXXXX
🤝 Contribución
Haz fork del proyecto

Crea tu rama (git checkout -b feature/awesome-feature)

Haz commit de tus cambios (git commit -m 'Add some feature')

Haz push a la rama (git push origin feature/awesome-feature)

Abre un Pull Request