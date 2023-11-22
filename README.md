# My Health in my hands

# liks:
* Figma [https://www.figma.com/file/B2eBW7OMqjVYqxXYm0jaR5/APP-MY-HEALTH-IN-MY-HANDS?type=design&node-id=0-1&mode=design&t=sNow4KvjigKp1I7D-0]


# Step-by-Step
Tutorial for first app: [https://ivanwhm.gitbook.io/laboratorios-de-codigo-do-flutter/escreva-seu-primeiro-aplicativo-flutter-parte-1/introducao]

# Comands

Flutter Doctor
Flutter run

# Requeriments machine local

To install and run Flutter, your development environment must meet these minimum requirements:

Operating Systems: Windows 10 or later (64-bit), x86-64 based.
Disk Space: 2.5 GB (does not include disk space for IDE/tools).
Tools: Flutter depends on these tools being available in your environment.
Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.

If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.



# Library and eviroments instaled

* FLUTTER [https://docs.flutter.dev/get-started/install]
* Extension VS CODE [https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter]
* Gráficos [https://github.com/imaNNeo/fl_chart/blob/master/example/lib/presentation/samples/pie/pie_chart_sample3.dart]


# ACCESS FIREBASE


// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBS2qQTe86U1kBpLs9tyaQXJEAdSyYfoY0",
  authDomain: "myhealthinmyhands-35ea7.firebaseapp.com",
  projectId: "myhealthinmyhands-35ea7",
  storageBucket: "myhealthinmyhands-35ea7.appspot.com",
  messagingSenderId: "384325889534",
  appId: "1:384325889534:web:9343cdd5360dac765764af",
  measurementId: "G-8H44HSFW6G"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
