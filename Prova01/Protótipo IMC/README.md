# Calculadora de IMC e Z-IMC

Aplicativo Flutter desenvolvido por:

- Marcos Paulo Barszcz Alves  
- Byanca Prado Rosa Hamilko Chaves

---

## 📝 Descrição

Este aplicativo tem como objetivo calcular o IMC (Índice de Massa Corporal) para adultos e o Z-IMC para crianças e adolescentes, fornecendo uma classificação baseada em diretrizes reconhecidas. O sistema oferece um design limpo e adaptativo, com campos de entrada específicos para idade em anos e meses, facilitando a análise de acordo com o sexo e a faixa etária.

---

## 📁 Localização do Código

O código principal da aplicação está localizado em:
`lib/main.dart`
Este arquivo contém a lógica de construção da interface e controle de estados do aplicativo, incluindo o cálculo de IMC e Z-IMC, seleção de tipo (adulto/criança), sexo e idade, além da exibição das classificações com base nos dados inseridos.

---

## 🎨 Design e Tecnologias

- Interface moderna em Flutter
- Cores contrastantes para facilitar a leitura (verde claro sobre fundo escuro)
- Layout responsivo com rolagem adaptada
- Campos adaptáveis com dropdowns dinâmicos
- Responsividade e acessibilidade como foco principal

---

## ⚙️ Funcionalidades

- Cálculo de IMC tradicional para adultos
- Cálculo de Z-IMC para crianças e adolescentes de 0 a 19 anos
- Classificação baseada em faixas clínicas
- Campos dinâmicos: exibição automática de meses se idade < 5 anos
- Validação de entrada e formatação de altura/peso

---

## 📚 Referências

### Classificação do IMC

As classificações utilizadas para o IMC e o Z-IMC foram baseadas nas:

- Diretrizes Brasileiras de Obesidade 2016 — ABESO  
📄 https://abeso.org.br/wp-content/uploads/2019/12/Diretrizes-Download-Diretrizes-Brasileiras-de-Obesidade-2016.pdf

| IMC (kg/m²)         | Classificação               | Risco de doença             |
|---------------------|-----------------------------|-----------------------------|
| Abaixo de 18,5      | Magro ou baixo peso         |  Normal ou elevado          |
| 18,5 – 24,9         | Normal ou eutrófico         |  Normal                     |
| 25 – 29,9           | Sobrepeso ou pré-obeso      | Pouco elevado               |
| 30 – 34,9           | Obesidade I                 | Elevado                     |
| 35 – 39,9           | Obesidade II                | Muito elevado               |
| 40 ou mais          | Obesidade III               | Muitíssimo elevado          |

### Classificação do Z-IMC

## 📏 Classificação de Z-IMC (Baseada na ABESO 2016)

| Condição                 | Idade: 0 a 5 anos (Z-IMC)         | Idade: 5 a 19 anos (Z-IMC)          |
|--------------------------|-----------------------------------|-------------------------------------|
| Magreza grave            | Escore Z < -3                     | Escore Z < -3                       |
| Magro / Desnutrido       | Escore Z ≥ -3 e < -2              | Escore Z ≥ -3 e < -2                |
| Eutrófico                | Escore Z ≥ -2 e ≤ +1              | Escore Z ≥ -2 e ≤ +1                |
| Risco de sobrepeso       | Escore Z > +1 e ≤ +2              | —                                   |
| Sobrepeso                | Escore Z > +2 e ≤ +3              | Escore Z > +1 e ≤ +2                |
| Obesidade                | Escore Z > +3                     | Escore Z > +2 e ≤ +3                |
| Obesidade grave          | —                                 | Escore Z > +3                       |

📖 Referência: [Diretrizes Brasileiras de Obesidade 2016 – ABESO](https://abeso.org.br/wp-content/uploads/2019/12/Diretrizes-Download-Diretrizes-Brasileiras-de-Obesidade-2016.pdf)

---

## 🧮 Lógica dos Cálculos

### 🔹 Cálculo do IMC (Índice de Massa Corporal)

O cálculo do IMC é realizado para todas as idades e sexos, e utiliza a seguinte fórmula padrão:
`IMC = peso (kg) / (altura (m) × altura (m))`

📌 **Exemplo**:  
Uma pessoa com 70 kg e 1,75 m de altura:  
IMC = 70 / (1.75 × 1.75) ≈ 22.86

### 🔹 Cálculo do Z-IMC

O Z-IMC é um escore padronizado utilizado para avaliar crianças e adolescentes com base no sexo e na idade em meses. A fórmula usada é:
Z = (IMC atual - Mediana) / Desvio Padrão (SD)

- Mediana (M) e SD são valores de referência fornecidos pela Organização Mundial da Saúde (OMS) conforme a idade (em meses) e o sexo da criança.
- SD é calculado como: SD = valor de IMC +1SD - Mediana

---

## 📊 Tabelas OMS para Z-IMC

Utilizamos os valores de referência fornecidos pela Organização Mundial da Saúde (WHO) para cálculo do Z-IMC, com base no sexo e na idade em meses.

### Meninos

- [0 a 2 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/child-growth-standards/indicators/body-mass-index-for-age/sft-bfa-boys-z-0-2.pdf?sfvrsn=b4e34cf1_7)  
- [2 a 5 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/child-growth-standards/indicators/body-mass-index-for-age/sft-bfa-boys-z-2-5.pdf?sfvrsn=1a873a91_7)  
- [5 a 19 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/growth-reference-5-19-years/bmi-for-age-%285-19-years%29/sft-bmifa-boys-z-5-19years.pdf)

### Meninas

- [0 a 2 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/child-growth-standards/indicators/body-mass-index-for-age/sft-bfa-girls-z-0-2.pdf?sfvrsn=fc6fc24e_20)  
- [2 a 5 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/child-growth-standards/indicators/body-mass-index-for-age/sft-bfa-girls-z-2-5.pdf?sfvrsn=c3692525_7)  
- [5 a 19 anos (z-scores)](https://cdn.who.int/media/docs/default-source/child-growth/growth-reference-5-19-years/bmi-for-age-%285-19-years%29/sft-bmifa-girls-z-5-19years.pdf)
