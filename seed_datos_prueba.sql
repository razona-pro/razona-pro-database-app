-- ═══════════════════════════════════════════════════════════════════
--  RazonaPro · Datos de prueba (programas, competencias, banco de preguntas)
--  Capitalización natural (con tildes) y formato normalizado.
--  Requisito previo: debe existir el administrador AMN001 (FK de questions).
--  Motor: PostgreSQL · Esquema: razonapro
-- ═══════════════════════════════════════════════════════════════════

-- ── Programas ────────────────────────────────────────────────────
INSERT INTO razonapro.programs (program_id, program_name, description, is_active) VALUES
('014', 'Ingeniería Ambiental',             'Programa de pregrado en Ingeniería Ambiental - UFPSO Ocaña',              'Y'),
('017', 'Ingeniería Civil',                 'Programa de pregrado en Ingeniería Civil - UFPSO Ocaña',                  'Y'),
('018', 'Ingeniería Mecánica',              'Programa de pregrado en Ingeniería Mecánica - UFPSO Ocaña',               'Y'),
('019', 'Ingeniería de Sistemas',           'Programa de pregrado en Ingeniería de Sistemas - UFPSO Ocaña',            'Y'),
('022', 'Contaduría Pública',               'Programa de pregrado en Contaduría Pública - UFPSO Ocaña',                'Y'),
('024', 'Derecho',                          'Programa de pregrado en Derecho - UFPSO Ocaña',                           'Y'),
('031', 'Comunicación Social',              'Programa de pregrado en Comunicación Social - UFPSO Ocaña',               'Y'),
('071', 'Zootecnia',                        'Programa de pregrado en Zootecnia - UFPSO Ocaña',                         'Y'),
('094', 'Tecnología en Gestión Comercial',  'Programa de Tecnología en Gestión Comercial y Financiera - UFPSO Ocaña',  'Y'),
('095', 'Administración de Empresas',       'Programa de pregrado en Administración de Empresas - UFPSO Ocaña',        'Y');

-- ── Competencias (módulos genéricos Saber Pro) ───────────────────
INSERT INTO razonapro.competences (competence_id, competence_name, description) VALUES
('CPE001', 'Lectura Crítica',           'Módulo genérico Saber Pro: comprensión y análisis crítico de textos'),
('CPE002', 'Razonamiento Cuantitativo', 'Módulo genérico Saber Pro: uso de las matemáticas en contextos reales'),
('CPE003', 'Competencias Ciudadanas',   'Módulo genérico Saber Pro: convivencia y participación democrática'),
('CPE004', 'Comunicación Escrita',      'Módulo genérico Saber Pro: producción de textos en contextos académicos'),
('CPE005', 'Inglés',                    'Módulo genérico Saber Pro: comprensión y uso del idioma inglés');


-- ═══════════════════════════════════════════════════════════════════
--  Banco de preguntas y opciones · 20 preguntas por competencia
--  admin_id: AMN001
-- ═══════════════════════════════════════════════════════════════════

-- ───────────────────────────────────────────────────────────────────
--  CPE001 · Lectura Crítica
-- ───────────────────────────────────────────────────────────────────
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, explanation, source, difficulty_level) VALUES

('CPE001','QTN0001','AMN001',
'Lee el siguiente fragmento: "La ciencia no es un conjunto de verdades absolutas, sino un proceso continuo de revisión y corrección de hipótesis a la luz de nueva evidencia." ¿Cuál es la idea principal del texto?',
'La idea principal señala que la ciencia es dinámica y provisional, no dogmática. El enunciado destaca el carácter revisable del conocimiento científico.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0002','AMN001',
'Lee el siguiente fragmento: "El lenguaje no solo comunica ideas, sino que también las construye. Sin palabras precisas, el pensamiento permanece nebuloso e impreciso." El autor del texto defiende principalmente que:',
'El autor establece una relación causal entre lenguaje y pensamiento, argumentando que el primero determina la claridad del segundo.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0003','AMN001',
'Lee el siguiente texto: "Los medios de comunicación presentan la realidad de manera fragmentada y selectiva. Lo que se muestra no es un reflejo fiel del mundo, sino una construcción interesada." La postura del autor frente a los medios de comunicación es:',
'El autor adopta una postura crítica y escéptica frente a los medios, cuestionando su objetividad y señalando que responden a intereses particulares.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0004','AMN001',
'En el texto: "Aunque muchos asocian la felicidad con la riqueza material, investigaciones recientes muestran que, pasado un umbral básico de bienestar económico, el dinero adicional no incrementa significativamente la satisfacción con la vida." La función del conector "aunque" en el texto es:',
'El conector "aunque" introduce una concesión: reconoce una creencia generalizada para luego contradecirla con evidencia empírica.',
'ICFES Saber Pro - Módulo Lectura Crítica','B'),

('CPE001','QTN0005','AMN001',
'Lee el siguiente argumento: "Si todos los ciudadanos participaran activamente en política, la democracia sería más sólida. Pero la mayoría de los ciudadanos no participa activamente. Por tanto, la democracia no es sólida." ¿Cuál es la conclusión del argumento?',
'La conclusión es la proposición que se deriva lógicamente de las premisas presentadas en el argumento.',
'ICFES Saber Pro - Módulo Lectura Crítica','B'),

('CPE001','QTN0006','AMN001',
'Lee el siguiente fragmento de opinión: "La educación pública en Colombia ha mejorado en cobertura, pero sigue siendo deficiente en calidad. No basta con llevar niños al aula si lo que aprenden allí no los prepara para los desafíos del siglo XXI." El autor utiliza principalmente el recurso argumentativo de:',
'El autor establece una distinción entre cantidad (cobertura) y calidad para reforzar su argumento central sobre las deficiencias del sistema educativo.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0007','AMN001',
'Lee el texto: "El escritor escribe porque no puede no escribir. La escritura es para él una necesidad vital, no una elección." ¿Qué figura retórica predomina en la expresión "no puede no escribir"?',
'La expresión "no puede no escribir" utiliza una doble negación para enfatizar la compulsión y la necesidad absoluta de escribir, recurso conocido como lítote.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0008','AMN001',
'Lee el siguiente fragmento: "La globalización ha traído prosperidad a algunos países, pero ha profundizado la brecha entre naciones ricas y pobres. Sus defensores ven en ella el motor del progreso; sus críticos, la causa de la desigualdad." ¿Cuál es el propósito comunicativo del texto?',
'El texto expone dos posturas opuestas sobre la globalización sin tomar partido, lo que indica un propósito informativo y de presentación equilibrada de perspectivas.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0009','AMN001',
'Lee el fragmento: "El arte no imita la naturaleza; la transforma. El pintor no copia lo que ve, sino que recrea el mundo según su visión interior." ¿Cuál de las siguientes opciones contradice directamente la tesis del autor?',
'La tesis del autor afirma que el arte transforma la realidad. La opción que la contradice directamente debe afirmar que el arte sí imita o copia la naturaleza.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0010','AMN001',
'Lee el siguiente texto argumentativo: "La pena de muerte no disuade el crimen. Estudios en países que la aplican muestran que las tasas de homicidio no disminuyen tras su implementación. Además, existe el riesgo irreparable de ejecutar a un inocente." ¿Cuántos argumentos presenta el autor para sustentar su posición?',
'El autor presenta dos argumentos: primero, la ineficacia disuasoria demostrada empíricamente; segundo, el riesgo de ejecutar a personas inocentes.',
'ICFES Saber Pro - Módulo Lectura Crítica','B'),

('CPE001','QTN0011','AMN001',
'Lee el fragmento: "La memoria no es un archivo fiel del pasado. Cada vez que recordamos, reconstruimos los eventos a partir de nuestras emociones y creencias actuales." ¿Con cuál de los siguientes enunciados estaría más de acuerdo el autor?',
'El autor argumenta que la memoria es reconstructiva y subjetiva, influida por el estado presente del sujeto, no un registro objetivo.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0012','AMN001',
'Lee el texto: "No hay mayor pobreza que la ignorancia. Un pueblo que no lee, no piensa; y un pueblo que no piensa, no puede ser libre." ¿Cuál es la relación lógica entre las dos oraciones del texto?',
'La segunda oración desarrolla y sustenta la afirmación de la primera mediante una cadena causal: ignorancia, no pensar, no ser libre.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0013','AMN001',
'Lee el siguiente fragmento: "La tecnología nos ha hecho más eficientes, pero menos profundos. Procesamos más información que nunca, pero comprendemos menos. Sabemos más datos, pero tenemos menos sabiduría." ¿Qué recurso estilístico predomina en el texto?',
'El texto emplea el paralelismo estructural reiterado (más X pero menos Y) para crear un efecto de contraste y énfasis acumulativo.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0014','AMN001',
'Lee el texto: "Los jóvenes de hoy leen menos que las generaciones anteriores." Un lector crítico debería cuestionar este enunciado porque:',
'Un lector crítico debe identificar afirmaciones generalizadoras sin evidencia. La frase carece de datos que sustenten la comparación intergeneracional.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0015','AMN001',
'Lee el siguiente texto: "El calentamiento global es un fenómeno comprobado científicamente. Sin embargo, algunos gobiernos prefieren ignorarlo para proteger sus industrias contaminantes." La expresión "sin embargo" cumple la función de:',
'El conector adversativo "sin embargo" introduce una contraposición entre el hecho científico establecido y la conducta política contraria a él.',
'ICFES Saber Pro - Módulo Lectura Crítica','B'),

('CPE001','QTN0016','AMN001',
'Lee el fragmento literario: "Esa noche, el silencio habló más fuerte que todas las palabras que ella nunca le dijo." ¿Qué figura literaria contiene la expresión destacada?',
'Atribuir al silencio la capacidad de "hablar" es una personificación o prosopopeya, figura que otorga cualidades humanas a entidades abstractas.',
'ICFES Saber Pro - Módulo Lectura Crítica','B'),

('CPE001','QTN0017','AMN001',
'Lee el texto: "Las redes sociales han democratizado la información. Ahora cualquier persona puede publicar contenido y llegar a millones de personas." ¿Cuál es la limitación más importante de este argumento?',
'El argumento ignora que democratizar la publicación no equivale a democratizar la veracidad o la calidad de la información, omitiendo el problema de la desinformación.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0018','AMN001',
'Lee el siguiente párrafo: "La ciudad moderna es un laberinto de concreto y velocidad. Sus habitantes corren sin saber hacia dónde, atrapados en rutinas que los vacían lentamente." El tono del texto es predominantemente:',
'Las metáforas negativas (laberinto, vacían) y la descripción de la alienación urbana configuran un tono crítico y pesimista frente a la vida en la ciudad moderna.',
'ICFES Saber Pro - Módulo Lectura Crítica','M'),

('CPE001','QTN0019','AMN001',
'Lee el argumento: "Deberíamos seguir la dieta de nuestros ancestros porque ellos vivían más sanos." ¿Qué falacia comete este razonamiento?',
'El argumento comete la falacia de apelación a la tradición (ad antiquitatem): asumir que algo es mejor por ser antiguo, sin evidencia que lo respalde.',
'ICFES Saber Pro - Módulo Lectura Crítica','A'),

('CPE001','QTN0020','AMN001',
'Lee el siguiente texto: "Invertir en educación no es un gasto, es la inversión más rentable que puede hacer una sociedad. Cada peso invertido en formación retorna multiplicado en productividad, innovación y cohesión social." La estrategia argumentativa del autor consiste en:',
'El autor resignifica el concepto de "gasto" reemplazándolo por el de "inversión rentable" y lo sustenta con beneficios económicos y sociales cuantificables.',
'ICFES Saber Pro - Módulo Lectura Crítica','M');

-- Opciones · CPE001
INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct) VALUES
('CPE001','QTN0001','OPT_A','La ciencia produce verdades definitivas que no pueden ser cuestionadas.','N'),
('CPE001','QTN0001','OPT_B','La ciencia avanza mediante la revisión constante de sus hipótesis ante nueva evidencia.','Y'),
('CPE001','QTN0001','OPT_C','La ciencia es un proceso cerrado que no admite correcciones externas.','N'),
('CPE001','QTN0001','OPT_D','La ciencia depende exclusivamente de la acumulación de datos sin interpretación.','N'),

('CPE001','QTN0002','OPT_A','El pensamiento es independiente del lenguaje que lo expresa.','N'),
('CPE001','QTN0002','OPT_B','El lenguaje es solo un medio neutral para transmitir ideas preexistentes.','N'),
('CPE001','QTN0002','OPT_C','El lenguaje no solo expresa el pensamiento, sino que lo estructura y lo define.','Y'),
('CPE001','QTN0002','OPT_D','La precisión lingüística es útil, pero no necesaria para el pensamiento profundo.','N'),

('CPE001','QTN0003','OPT_A','Admirativa y positiva, destacando el avance de los medios.','N'),
('CPE001','QTN0003','OPT_B','Neutral e imparcial, sin emitir juicio sobre los medios.','N'),
('CPE001','QTN0003','OPT_C','Crítica y escéptica, cuestionando la objetividad de los medios.','Y'),
('CPE001','QTN0003','OPT_D','Indiferente, reconociendo que los medios son irrelevantes.','N'),

('CPE001','QTN0004','OPT_A','Introduce una causa que explica el fenómeno descrito.','N'),
('CPE001','QTN0004','OPT_B','Introduce una concesión para luego contradecirla con evidencia.','Y'),
('CPE001','QTN0004','OPT_C','Introduce una consecuencia lógica de la idea anterior.','N'),
('CPE001','QTN0004','OPT_D','Introduce una condición necesaria para que se cumpla la afirmación.','N'),

('CPE001','QTN0005','OPT_A','Todos los ciudadanos deben participar activamente en política.','N'),
('CPE001','QTN0005','OPT_B','La mayoría de los ciudadanos no participa activamente en política.','N'),
('CPE001','QTN0005','OPT_C','La democracia no es sólida.','Y'),
('CPE001','QTN0005','OPT_D','La participación ciudadana fortalece la democracia.','N'),

('CPE001','QTN0006','OPT_A','Apelación a la autoridad de expertos en educación.','N'),
('CPE001','QTN0006','OPT_B','Uso de estadísticas para demostrar el avance educativo.','N'),
('CPE001','QTN0006','OPT_C','Distinción entre cantidad y calidad para reforzar su argumento.','Y'),
('CPE001','QTN0006','OPT_D','Comparación con sistemas educativos de otros países.','N'),

('CPE001','QTN0007','OPT_A','Metáfora','N'),
('CPE001','QTN0007','OPT_B','Hipérbole','N'),
('CPE001','QTN0007','OPT_C','Lítote','Y'),
('CPE001','QTN0007','OPT_D','Anáfora','N'),

('CPE001','QTN0008','OPT_A','Persuadir al lector de que la globalización es beneficiosa.','N'),
('CPE001','QTN0008','OPT_B','Presentar de forma equilibrada dos posturas opuestas sobre la globalización.','Y'),
('CPE001','QTN0008','OPT_C','Criticar a los defensores de la globalización.','N'),
('CPE001','QTN0008','OPT_D','Demostrar que la globalización solo beneficia a los países ricos.','N'),

('CPE001','QTN0009','OPT_A','El arte busca representar la realidad interior del artista.','N'),
('CPE001','QTN0009','OPT_B','El arte es una recreación subjetiva de la experiencia del mundo.','N'),
('CPE001','QTN0009','OPT_C','El arte consiste en copiar fielmente la naturaleza observable.','Y'),
('CPE001','QTN0009','OPT_D','El arte transforma la realidad a través de la visión del artista.','N'),

('CPE001','QTN0010','OPT_A','Uno','N'),
('CPE001','QTN0010','OPT_B','Dos','Y'),
('CPE001','QTN0010','OPT_C','Tres','N'),
('CPE001','QTN0010','OPT_D','Cuatro','N'),

('CPE001','QTN0011','OPT_A','Los recuerdos son registros exactos e inmutables de lo que vivimos.','N'),
('CPE001','QTN0011','OPT_B','Recordar es un acto creativo influido por nuestro estado emocional y mental actual.','Y'),
('CPE001','QTN0011','OPT_C','La memoria es más fiable cuando los eventos fueron muy intensos emocionalmente.','N'),
('CPE001','QTN0011','OPT_D','El pasado solo puede conocerse a través de documentos escritos, no de recuerdos.','N'),

('CPE001','QTN0012','OPT_A','La segunda oración contradice la primera.','N'),
('CPE001','QTN0012','OPT_B','La segunda oración ejemplifica con un caso particular la afirmación general de la primera.','N'),
('CPE001','QTN0012','OPT_C','La segunda oración desarrolla y sustenta la primera mediante una cadena causal.','Y'),
('CPE001','QTN0012','OPT_D','La segunda oración plantea una excepción a la regla establecida en la primera.','N'),

('CPE001','QTN0013','OPT_A','Metáfora continua.','N'),
('CPE001','QTN0013','OPT_B','Paralelismo estructural con contraste acumulativo.','Y'),
('CPE001','QTN0013','OPT_C','Enumeración caótica de ideas sin relación.','N'),
('CPE001','QTN0013','OPT_D','Hipérbole de los efectos negativos de la tecnología.','N'),

('CPE001','QTN0014','OPT_A','Porque los jóvenes de hoy sí leen tanto como las generaciones anteriores.','N'),
('CPE001','QTN0014','OPT_B','Porque hace una generalización sin presentar datos ni evidencia que la sustente.','Y'),
('CPE001','QTN0014','OPT_C','Porque compara épocas históricas que no son comparables entre sí.','N'),
('CPE001','QTN0014','OPT_D','Porque el concepto de "lectura" ha cambiado con las nuevas tecnologías.','N'),

('CPE001','QTN0015','OPT_A','Introducir una causa que explica el comportamiento de los gobiernos.','N'),
('CPE001','QTN0015','OPT_B','Introducir una consecuencia directa del calentamiento global.','N'),
('CPE001','QTN0015','OPT_C','Introducir una contraposición entre el hecho científico y la conducta política.','Y'),
('CPE001','QTN0015','OPT_D','Introducir una condición para que los gobiernos actúen frente al cambio climático.','N'),

('CPE001','QTN0016','OPT_A','Metáfora','N'),
('CPE001','QTN0016','OPT_B','Hipérbole','N'),
('CPE001','QTN0016','OPT_C','Personificación','Y'),
('CPE001','QTN0016','OPT_D','Símil','N'),

('CPE001','QTN0017','OPT_A','No considera que la mayoría de las personas no tiene acceso a internet.','N'),
('CPE001','QTN0017','OPT_B','Ignora que democratizar la publicación no garantiza la calidad o veracidad de la información.','Y'),
('CPE001','QTN0017','OPT_C','Sobreestima la capacidad de los medios tradicionales para llegar a grandes audiencias.','N'),
('CPE001','QTN0017','OPT_D','No reconoce que las redes sociales son un fenómeno reciente.','N'),

('CPE001','QTN0018','OPT_A','Nostálgico y melancólico.','N'),
('CPE001','QTN0018','OPT_B','Irónico y humorístico.','N'),
('CPE001','QTN0018','OPT_C','Crítico y pesimista.','Y'),
('CPE001','QTN0018','OPT_D','Esperanzador y propositivo.','N'),

('CPE001','QTN0019','OPT_A','Falacia ad hominem.','N'),
('CPE001','QTN0019','OPT_B','Falsa dicotomía.','N'),
('CPE001','QTN0019','OPT_C','Apelación a la tradición.','Y'),
('CPE001','QTN0019','OPT_D','Generalización apresurada.','N'),

('CPE001','QTN0020','OPT_A','Usa datos estadísticos para demostrar el retorno económico de la educación.','N'),
('CPE001','QTN0020','OPT_B','Resignifica la educación como inversión rentable enumerando sus beneficios sociales y económicos.','Y'),
('CPE001','QTN0020','OPT_C','Compara el sistema educativo colombiano con el de países desarrollados.','N'),
('CPE001','QTN0020','OPT_D','Apela a la emoción del lector describiendo casos de éxito educativo.','N');


-- ───────────────────────────────────────────────────────────────────
--  CPE002 · Razonamiento Cuantitativo
-- ───────────────────────────────────────────────────────────────────
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, explanation, source, difficulty_level) VALUES

('CPE002','QTN0021','AMN001',
'En una tienda, un artículo cuesta $120.000 y tiene un descuento del 25 %. ¿Cuánto paga el cliente?',
'El descuento es el 25 % de 120.000 = 30.000. El cliente paga 120.000 - 30.000 = 90.000.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0022','AMN001',
'Si el 40 % de los estudiantes de un salón son mujeres y hay 18 mujeres, ¿cuántos estudiantes hay en total en el salón?',
'Si 18 representa el 40 %, entonces el total es 18 / 0,40 = 45 estudiantes.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0023','AMN001',
'Una empresa tuvo ingresos de $500 millones en 2022 y de $650 millones en 2023. ¿Cuál fue el porcentaje de incremento?',
'Incremento = (650 - 500) / 500 × 100 = 150 / 500 × 100 = 30 %.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0024','AMN001',
'En una gráfica de barras, el municipio A tiene 4.500 habitantes, el B tiene 3.200 y el C tiene 6.800. ¿Cuál es el promedio de habitantes entre los tres municipios?',
'Promedio = (4.500 + 3.200 + 6.800) / 3 = 14.500 / 3 ≈ 4.833 habitantes.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0025','AMN001',
'Un automóvil recorre 360 km en 4 horas. ¿A qué velocidad promedio viaja en km/h?',
'Velocidad = distancia / tiempo = 360 / 4 = 90 km/h.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0026','AMN001',
'Si una tela cuesta $15.000 el metro, ¿cuánto cuestan 3,5 metros de esa tela?',
'Costo total = 15.000 × 3,5 = $52.500.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0027','AMN001',
'La siguiente tabla muestra las ventas mensuales de una empresa (en millones): enero 12, febrero 15, marzo 9, abril 18. ¿En qué mes las ventas se acercan más al 30 % del total acumulado de los cuatro meses?',
'Total acumulado = 12 + 15 + 9 + 18 = 54. El 30 % equivale a 16,2 millones. La participación de febrero (15 / 54 = 27,8 %) es la que más se aproxima al 30 %.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0028','AMN001',
'En un grupo de 60 personas, 3 de cada 4 prefieren café sobre té. ¿Cuántas personas prefieren té?',
'Si 3/4 prefieren café, entonces 1/4 prefiere té. 60 × (1/4) = 15 personas.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0029','AMN001',
'Un producto aumentó su precio de $80.000 a $100.000. ¿Cuál fue el porcentaje de aumento?',
'Porcentaje de aumento = (100.000 - 80.000) / 80.000 × 100 = 20.000 / 80.000 × 100 = 25 %.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0030','AMN001',
'Una gráfica circular muestra que el 35 % del presupuesto familiar se destina a alimentación, el 25 % a vivienda, el 20 % a transporte y el resto a otros gastos. Si el presupuesto mensual es de $2.400.000, ¿cuánto se destina a otros gastos?',
'Otros gastos = 100 % - 35 % - 25 % - 20 % = 20 %. Monto = 0,20 × 2.400.000 = $480.000.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0031','AMN001',
'Si x + 5 = 12, ¿cuál es el valor de 3x?',
'De x + 5 = 12 se obtiene x = 7. Por lo tanto, 3x = 21.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0032','AMN001',
'Un trabajador gana $1.200.000 mensuales. Le descuentan el 8 % para salud y el 4 % para pensión. ¿Cuánto recibe neto?',
'Descuentos = 12 % de 1.200.000 = 144.000. Salario neto = 1.200.000 - 144.000 = $1.056.000.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0033','AMN001',
'En la secuencia numérica 2, 6, 18, 54, ___ , ¿cuál es el siguiente número?',
'La razón de la sucesión geométrica es 3 (cada término se multiplica por 3). Siguiente término: 54 × 3 = 162.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0034','AMN001',
'Si se lanza un dado justo de seis caras, ¿cuál es la probabilidad de obtener un número par?',
'Los números pares en un dado son 2, 4 y 6 (3 casos favorables de 6 posibles). Probabilidad = 3/6 = 1/2.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0035','AMN001',
'La siguiente tabla muestra la distribución de edades en una empresa: 20-30 años, 15 empleados; 31-40 años, 22 empleados; 41-50 años, 13 empleados. ¿Qué porcentaje representa el grupo de 31-40 años del total de empleados?',
'Total = 15 + 22 + 13 = 50. Porcentaje = 22 / 50 × 100 = 44 %.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0036','AMN001',
'Un grifo llena un tanque en 6 horas y otro grifo lo llena en 3 horas. Si ambos grifos trabajan juntos, ¿en cuántas horas llenan el tanque?',
'Tasa combinada = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2. Tiempo = 2 horas.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','A'),

('CPE002','QTN0037','AMN001',
'Una tienda vende 3 camisas por $75.000. ¿Cuánto cuestan 7 camisas al mismo precio unitario?',
'Precio unitario = 75.000 / 3 = 25.000. Precio de 7 = 25.000 × 7 = $175.000.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0038','AMN001',
'En un gráfico de líneas, las ventas de una empresa pasaron de 200 unidades en enero a 350 en junio. Asumiendo un crecimiento lineal, ¿cuántas unidades aproximadas se vendieron en marzo?',
'El crecimiento total es de 150 unidades en 5 meses (enero a junio), es decir 30 unidades por mes. Marzo es el mes 3: 200 + 2 × 30 = 260 unidades.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','M'),

('CPE002','QTN0039','AMN001',
'Si el área de un cuadrado es 64 m², ¿cuánto mide su perímetro?',
'Lado = √64 = 8 m. Perímetro = 4 × 8 = 32 m.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B'),

('CPE002','QTN0040','AMN001',
'Un estudiante obtuvo las siguientes calificaciones: 3,5; 4,0; 3,8; 4,2 y 3,5. ¿Cuál es su promedio?',
'Suma = 3,5 + 4,0 + 3,8 + 4,2 + 3,5 = 19,0. Promedio = 19,0 / 5 = 3,8.',
'ICFES Saber Pro - Módulo Razonamiento Cuantitativo','B');

-- Opciones · CPE002
INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct) VALUES
('CPE002','QTN0021','OPT_A','$85.000','N'),
('CPE002','QTN0021','OPT_B','$90.000','Y'),
('CPE002','QTN0021','OPT_C','$95.000','N'),
('CPE002','QTN0021','OPT_D','$100.000','N'),

('CPE002','QTN0022','OPT_A','40 estudiantes','N'),
('CPE002','QTN0022','OPT_B','42 estudiantes','N'),
('CPE002','QTN0022','OPT_C','45 estudiantes','Y'),
('CPE002','QTN0022','OPT_D','50 estudiantes','N'),

('CPE002','QTN0023','OPT_A','25 %','N'),
('CPE002','QTN0023','OPT_B','28 %','N'),
('CPE002','QTN0023','OPT_C','30 %','Y'),
('CPE002','QTN0023','OPT_D','35 %','N'),

('CPE002','QTN0024','OPT_A','4.500 habitantes','N'),
('CPE002','QTN0024','OPT_B','4.833 habitantes','Y'),
('CPE002','QTN0024','OPT_C','5.100 habitantes','N'),
('CPE002','QTN0024','OPT_D','4.167 habitantes','N'),

('CPE002','QTN0025','OPT_A','80 km/h','N'),
('CPE002','QTN0025','OPT_B','85 km/h','N'),
('CPE002','QTN0025','OPT_C','90 km/h','Y'),
('CPE002','QTN0025','OPT_D','95 km/h','N'),

('CPE002','QTN0026','OPT_A','$45.000','N'),
('CPE002','QTN0026','OPT_B','$50.000','N'),
('CPE002','QTN0026','OPT_C','$52.500','Y'),
('CPE002','QTN0026','OPT_D','$55.000','N'),

('CPE002','QTN0027','OPT_A','Enero','N'),
('CPE002','QTN0027','OPT_B','Febrero','Y'),
('CPE002','QTN0027','OPT_C','Marzo','N'),
('CPE002','QTN0027','OPT_D','Abril','N'),

('CPE002','QTN0028','OPT_A','10 personas','N'),
('CPE002','QTN0028','OPT_B','12 personas','N'),
('CPE002','QTN0028','OPT_C','15 personas','Y'),
('CPE002','QTN0028','OPT_D','20 personas','N'),

('CPE002','QTN0029','OPT_A','20 %','N'),
('CPE002','QTN0029','OPT_B','22 %','N'),
('CPE002','QTN0029','OPT_C','25 %','Y'),
('CPE002','QTN0029','OPT_D','30 %','N'),

('CPE002','QTN0030','OPT_A','$360.000','N'),
('CPE002','QTN0030','OPT_B','$420.000','N'),
('CPE002','QTN0030','OPT_C','$480.000','Y'),
('CPE002','QTN0030','OPT_D','$500.000','N'),

('CPE002','QTN0031','OPT_A','18','N'),
('CPE002','QTN0031','OPT_B','21','Y'),
('CPE002','QTN0031','OPT_C','24','N'),
('CPE002','QTN0031','OPT_D','36','N'),

('CPE002','QTN0032','OPT_A','$1.080.000','N'),
('CPE002','QTN0032','OPT_B','$1.044.000','N'),
('CPE002','QTN0032','OPT_C','$1.056.000','Y'),
('CPE002','QTN0032','OPT_D','$1.100.000','N'),

('CPE002','QTN0033','OPT_A','108','N'),
('CPE002','QTN0033','OPT_B','144','N'),
('CPE002','QTN0033','OPT_C','162','Y'),
('CPE002','QTN0033','OPT_D','216','N'),

('CPE002','QTN0034','OPT_A','1/6','N'),
('CPE002','QTN0034','OPT_B','1/3','N'),
('CPE002','QTN0034','OPT_C','1/2','Y'),
('CPE002','QTN0034','OPT_D','2/3','N'),

('CPE002','QTN0035','OPT_A','40 %','N'),
('CPE002','QTN0035','OPT_B','42 %','N'),
('CPE002','QTN0035','OPT_C','44 %','Y'),
('CPE002','QTN0035','OPT_D','46 %','N'),

('CPE002','QTN0036','OPT_A','1 hora','N'),
('CPE002','QTN0036','OPT_B','2 horas','Y'),
('CPE002','QTN0036','OPT_C','3 horas','N'),
('CPE002','QTN0036','OPT_D','4 horas','N'),

('CPE002','QTN0037','OPT_A','$150.000','N'),
('CPE002','QTN0037','OPT_B','$165.000','N'),
('CPE002','QTN0037','OPT_C','$175.000','Y'),
('CPE002','QTN0037','OPT_D','$180.000','N'),

('CPE002','QTN0038','OPT_A','240 unidades','N'),
('CPE002','QTN0038','OPT_B','250 unidades','N'),
('CPE002','QTN0038','OPT_C','260 unidades','Y'),
('CPE002','QTN0038','OPT_D','280 unidades','N'),

('CPE002','QTN0039','OPT_A','24 m','N'),
('CPE002','QTN0039','OPT_B','28 m','N'),
('CPE002','QTN0039','OPT_C','32 m','Y'),
('CPE002','QTN0039','OPT_D','36 m','N'),

('CPE002','QTN0040','OPT_A','3,6','N'),
('CPE002','QTN0040','OPT_B','3,7','N'),
('CPE002','QTN0040','OPT_C','3,8','Y'),
('CPE002','QTN0040','OPT_D','4,0','N');


-- ───────────────────────────────────────────────────────────────────
--  CPE003 · Competencias Ciudadanas
-- ───────────────────────────────────────────────────────────────────
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, explanation, source, difficulty_level) VALUES

('CPE003','QTN0041','AMN001',
'Un ciudadano descubre que su alcalde está desviando recursos públicos destinados a la salud. ¿Cuál es el mecanismo de participación ciudadana más adecuado para denunciar esta situación?',
'La denuncia ante la Contraloría o la Procuraduría son los mecanismos institucionales diseñados para el control de la gestión pública y el manejo de los recursos del Estado.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0042','AMN001',
'La Constitución Política de Colombia de 1991 establece que Colombia es un Estado social de derecho. Esto significa principalmente que:',
'El Estado social de derecho implica que el Estado no solo debe garantizar derechos formales, sino también condiciones materiales mínimas de dignidad para todos los ciudadanos.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0043','AMN001',
'Un grupo de estudiantes quiere exigirle al rector de su universidad que rinda cuentas sobre el uso de los recursos de bienestar estudiantil. ¿Cuál mecanismo de participación es el más apropiado?',
'La audiencia pública de rendición de cuentas es el mecanismo institucional diseñado para que los gobernantes o directivos presenten un informe de su gestión a la ciudadanía.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0044','AMN001',
'Según la Constitución colombiana, los derechos fundamentales son aquellos que:',
'Los derechos fundamentales son inherentes a la dignidad humana, de aplicación inmediata y protegidos especialmente mediante la acción de tutela.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0045','AMN001',
'En Colombia, la acción de tutela puede ser presentada por cualquier persona cuando considera que sus derechos fundamentales han sido vulnerados. Sin embargo, la tutela tiene un requisito principal, que es:',
'La tutela procede cuando no existe otro mecanismo judicial para proteger el derecho vulnerado, salvo que se use como mecanismo transitorio para evitar un perjuicio irremediable.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','A'),

('CPE003','QTN0046','AMN001',
'¿Cuál de los siguientes es un ejemplo de ejercicio de la democracia participativa en Colombia?',
'El cabildo abierto es un mecanismo de participación directa donde la comunidad puede deliberar sobre asuntos de interés público con sus autoridades locales.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0047','AMN001',
'Un vecino considera que una obra pública afecta negativamente su barrio. Para oponerse legalmente, ¿qué mecanismo constitucional puede utilizar?',
'La acción popular protege los derechos e intereses colectivos, como el espacio público, el ambiente y la seguridad, frente a actuaciones que los amenacen o vulneren.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0048','AMN001',
'La separación de poderes en el Estado colombiano busca principalmente:',
'La separación de poderes es un mecanismo de control mutuo (pesos y contrapesos) para evitar la concentración de poder y garantizar el funcionamiento democrático del Estado.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0049','AMN001',
'¿Cuál de las siguientes situaciones representa una violación al principio de igualdad consagrado en la Constitución colombiana?',
'El principio de igualdad prohíbe las discriminaciones basadas en características como el origen étnico, el género o las creencias religiosas.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0050','AMN001',
'En una comunidad, un grupo mayoritario quiere imponer una norma que afecta negativamente los derechos de una minoría étnica. Desde la perspectiva de la democracia constitucional, esto:',
'La democracia constitucional establece límites al poder de las mayorías para proteger los derechos de las minorías, principio conocido como contramayoritarismo.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','A'),

('CPE003','QTN0051','AMN001',
'¿Qué institución en Colombia es la encargada de vigilar la conducta de los servidores públicos y proteger los derechos humanos?',
'La Procuraduría General de la Nación es el máximo organismo de control disciplinario en Colombia y vela por la conducta de los servidores públicos.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0052','AMN001',
'Un periodista es amenazado por publicar una investigación sobre corrupción. ¿Cuál derecho fundamental está siendo vulnerado principalmente?',
'La amenaza por ejercer el periodismo vulnera la libertad de expresión y de prensa, derechos fundamentales garantizados en el artículo 20 de la Constitución.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0053','AMN001',
'¿Cuál de los siguientes mecanismos permite a los ciudadanos revocar el mandato de un alcalde o gobernador que no cumple con su programa de gobierno?',
'La revocatoria del mandato es el mecanismo constitucional que permite a los ciudadanos destituir a alcaldes y gobernadores que incumplan su programa de gobierno.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0054','AMN001',
'¿Cuál es la diferencia principal entre un derecho civil y un derecho político?',
'Los derechos civiles protegen la libertad individual frente al Estado, mientras que los derechos políticos permiten la participación en el gobierno y en la toma de decisiones públicas.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0055','AMN001',
'Un estudiante de 17 años quiere votar en las próximas elecciones presidenciales. ¿Puede hacerlo según la legislación colombiana?',
'En Colombia, la mayoría de edad electoral es a los 18 años para la mayoría de los cargos, con excepción de elecciones estudiantiles y consultas internas, donde pueden participar menores.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0056','AMN001',
'¿Qué es el bloque de constitucionalidad en Colombia?',
'El bloque de constitucionalidad está conformado por normas y principios que, sin estar en el texto de la Constitución, tienen rango constitucional por integración expresa o tácita.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','A'),

('CPE003','QTN0057','AMN001',
'Una empresa vierte residuos tóxicos en un río afectando a varias comunidades. ¿Cuál mecanismo jurídico colectivo es el más apropiado para proteger a las comunidades afectadas?',
'La acción popular es el mecanismo diseñado para proteger derechos e intereses colectivos, como el ambiente sano y el agua potable, frente a amenazas o vulneraciones.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0058','AMN001',
'El principio de dignidad humana en la Constitución colombiana implica que:',
'La dignidad humana es el fundamento de todos los derechos fundamentales y establece que las personas no pueden ser tratadas como medios, sino como fines en sí mismas.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M'),

('CPE003','QTN0059','AMN001',
'En Colombia, la Corte Constitucional tiene entre sus funciones principales:',
'La Corte Constitucional es el máximo tribunal de lo constitucional y le corresponde guardar la integridad y la supremacía de la Constitución.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','B'),

('CPE003','QTN0060','AMN001',
'¿Cuál de los siguientes enunciados describe mejor el concepto de Estado laico?',
'Un Estado laico es aquel que mantiene una separación entre las instituciones del gobierno y las organizaciones religiosas, garantizando la libertad de cultos sin preferir ninguna religión.',
'ICFES Saber Pro - Módulo Competencias Ciudadanas','M');

-- Opciones · CPE003
INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct) VALUES
('CPE003','QTN0041','OPT_A','Publicar la situación en redes sociales.','N'),
('CPE003','QTN0041','OPT_B','Presentar una denuncia ante la Contraloría o la Procuraduría General.','Y'),
('CPE003','QTN0041','OPT_C','Organizar una marcha de protesta frente a la alcaldía.','N'),
('CPE003','QTN0041','OPT_D','Convocar un paro cívico en el municipio.','N'),

('CPE003','QTN0042','OPT_A','El Estado solo debe garantizar el orden público y la seguridad.','N'),
('CPE003','QTN0042','OPT_B','El Estado garantiza derechos formales y condiciones materiales mínimas de dignidad.','Y'),
('CPE003','QTN0042','OPT_C','El Estado puede intervenir en la vida privada de los ciudadanos para garantizar el bienestar.','N'),
('CPE003','QTN0042','OPT_D','El Estado delega todas sus funciones sociales en el sector privado.','N'),

('CPE003','QTN0043','OPT_A','Tutela colectiva ante el rector.','N'),
('CPE003','QTN0043','OPT_B','Acción popular ante un juez.','N'),
('CPE003','QTN0043','OPT_C','Audiencia pública de rendición de cuentas.','Y'),
('CPE003','QTN0043','OPT_D','Derecho de petición ante el Ministerio de Educación.','N'),

('CPE003','QTN0044','OPT_A','Son reconocidos solo a los ciudadanos colombianos mayores de 18 años.','N'),
('CPE003','QTN0044','OPT_B','Son inherentes a la dignidad humana, de aplicación inmediata y protegidos por tutela.','Y'),
('CPE003','QTN0044','OPT_C','Son otorgados por el Estado según las necesidades de cada ciudadano.','N'),
('CPE003','QTN0044','OPT_D','Son derechos que solo aplican en situaciones de emergencia o crisis.','N'),

('CPE003','QTN0045','OPT_A','Que el afectado tenga abogado para presentarla.','N'),
('CPE003','QTN0045','OPT_B','Que el derecho vulnerado sea de carácter económico.','N'),
('CPE003','QTN0045','OPT_C','Que no exista otro mecanismo judicial idóneo para proteger el derecho vulnerado.','Y'),
('CPE003','QTN0045','OPT_D','Que la vulneración haya sido cometida por una entidad del Estado.','N'),

('CPE003','QTN0046','OPT_A','Votar por un candidato a la presidencia.','N'),
('CPE003','QTN0046','OPT_B','Participar en un cabildo abierto municipal.','Y'),
('CPE003','QTN0046','OPT_C','Pagar impuestos oportunamente.','N'),
('CPE003','QTN0046','OPT_D','Respetar las leyes del Estado.','N'),

('CPE003','QTN0047','OPT_A','Acción de tutela.','N'),
('CPE003','QTN0047','OPT_B','Acción de nulidad.','N'),
('CPE003','QTN0047','OPT_C','Acción popular.','Y'),
('CPE003','QTN0047','OPT_D','Acción de grupo.','N'),

('CPE003','QTN0048','OPT_A','Aumentar la eficiencia del Estado concentrando decisiones en el ejecutivo.','N'),
('CPE003','QTN0048','OPT_B','Evitar la concentración del poder y garantizar controles mutuos entre las ramas del poder.','Y'),
('CPE003','QTN0048','OPT_C','Separar la política de la economía para garantizar estabilidad.','N'),
('CPE003','QTN0048','OPT_D','Distribuir los recursos del Estado entre los diferentes territorios.','N'),

('CPE003','QTN0049','OPT_A','Una empresa exige experiencia mínima de dos años para un cargo directivo.','N'),
('CPE003','QTN0049','OPT_B','Una institución niega empleo a una persona por su origen étnico.','Y'),
('CPE003','QTN0049','OPT_C','Un colegio exige un nivel mínimo académico para admitir estudiantes.','N'),
('CPE003','QTN0049','OPT_D','Un banco evalúa la capacidad de pago antes de otorgar un crédito.','N'),

('CPE003','QTN0050','OPT_A','Es legítimo porque en democracia la mayoría siempre tiene la razón.','N'),
('CPE003','QTN0050','OPT_B','Es aceptable si la decisión fue tomada mediante votación libre.','N'),
('CPE003','QTN0050','OPT_C','Es ilegítimo porque los derechos de las minorías no pueden ser vulnerados por la mayoría.','Y'),
('CPE003','QTN0050','OPT_D','Es válido si la minoría tuvo la oportunidad de participar en la votación.','N'),

('CPE003','QTN0051','OPT_A','La Contraloría General de la República.','N'),
('CPE003','QTN0051','OPT_B','La Defensoría del Pueblo.','N'),
('CPE003','QTN0051','OPT_C','La Procuraduría General de la Nación.','Y'),
('CPE003','QTN0051','OPT_D','La Fiscalía General de la Nación.','N'),

('CPE003','QTN0052','OPT_A','Derecho a la intimidad.','N'),
('CPE003','QTN0052','OPT_B','Derecho a la libertad de expresión y de prensa.','Y'),
('CPE003','QTN0052','OPT_C','Derecho al trabajo.','N'),
('CPE003','QTN0052','OPT_D','Derecho a la seguridad personal.','N'),

('CPE003','QTN0053','OPT_A','El referendo.','N'),
('CPE003','QTN0053','OPT_B','La iniciativa popular legislativa.','N'),
('CPE003','QTN0053','OPT_C','La revocatoria del mandato.','Y'),
('CPE003','QTN0053','OPT_D','El plebiscito.','N'),

('CPE003','QTN0054','OPT_A','Los derechos civiles son colectivos y los políticos son individuales.','N'),
('CPE003','QTN0054','OPT_B','Los derechos civiles protegen la libertad individual y los políticos permiten la participación en el gobierno.','Y'),
('CPE003','QTN0054','OPT_C','Los derechos civiles solo aplican en conflictos privados y los políticos en guerras.','N'),
('CPE003','QTN0054','OPT_D','Los derechos civiles son reconocidos por la ley ordinaria y los políticos por tratados internacionales.','N'),

('CPE003','QTN0055','OPT_A','Sí, porque la ley permite votar desde los 16 años en Colombia.','N'),
('CPE003','QTN0055','OPT_B','No, porque en Colombia la mayoría de edad electoral es a los 18 años.','Y'),
('CPE003','QTN0055','OPT_C','Sí, con autorización escrita de sus padres o tutores.','N'),
('CPE003','QTN0055','OPT_D','No, hasta que no haya completado el bachillerato.','N'),

('CPE003','QTN0056','OPT_A','Es el conjunto de normas que regulan el funcionamiento del Congreso.','N'),
('CPE003','QTN0056','OPT_B','Son las normas y principios que, sin estar en la Constitución, tienen rango constitucional.','Y'),
('CPE003','QTN0056','OPT_C','Es la jerarquía de leyes establecida por la Constitución.','N'),
('CPE003','QTN0056','OPT_D','Son los tratados internacionales ratificados por Colombia.','N'),

('CPE003','QTN0057','OPT_A','Acción de tutela.','N'),
('CPE003','QTN0057','OPT_B','Derecho de petición.','N'),
('CPE003','QTN0057','OPT_C','Acción popular.','Y'),
('CPE003','QTN0057','OPT_D','Acción de cumplimiento.','N'),

('CPE003','QTN0058','OPT_A','Las personas deben ser tratadas según su utilidad social.','N'),
('CPE003','QTN0058','OPT_B','Las personas son fines en sí mismas y no pueden ser instrumentalizadas.','Y'),
('CPE003','QTN0058','OPT_C','La dignidad es un privilegio que el Estado otorga a quienes cumplen sus deberes.','N'),
('CPE003','QTN0058','OPT_D','La dignidad solo aplica a los ciudadanos que gozan de plena capacidad civil.','N'),

('CPE003','QTN0059','OPT_A','Juzgar a los funcionarios públicos por delitos comunes.','N'),
('CPE003','QTN0059','OPT_B','Revisar la legalidad de los actos administrativos del ejecutivo.','N'),
('CPE003','QTN0059','OPT_C','Guardar la integridad y la supremacía de la Constitución.','Y'),
('CPE003','QTN0059','OPT_D','Administrar los recursos del Estado de manera eficiente.','N'),

('CPE003','QTN0060','OPT_A','Un Estado donde la religión católica es oficial, pero se toleran otras.','N'),
('CPE003','QTN0060','OPT_B','Un Estado que prohíbe toda expresión religiosa en el espacio público.','N'),
('CPE003','QTN0060','OPT_C','Un Estado que separa las instituciones gubernamentales de las religiosas, garantizando la libertad de cultos.','Y'),
('CPE003','QTN0060','OPT_D','Un Estado que financia por igual a todas las religiones reconocidas legalmente.','N');


-- ───────────────────────────────────────────────────────────────────
--  CPE004 · Comunicación Escrita
-- ───────────────────────────────────────────────────────────────────
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, explanation, source, difficulty_level) VALUES

('CPE004','QTN0061','AMN001',
'Al escribir un texto académico, ¿cuál es la función principal de la tesis?',
'La tesis es la proposición central que el autor defenderá a lo largo del texto. Es el núcleo argumentativo que orienta toda la producción escrita.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0062','AMN001',
'Lee el siguiente párrafo introductorio: "El cambio climático es uno de los mayores retos de nuestra época. Diversos estudios señalan sus causas antropogénicas. En este ensayo se argumentará que las políticas actuales son insuficientes para detenerlo." ¿Qué elemento del párrafo corresponde a la tesis?',
'La tesis es el enunciado que presenta la posición del autor que será desarrollada y argumentada en el texto.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0063','AMN001',
'¿Cuál de los siguientes conectores es el más apropiado para introducir una conclusión en un texto argumentativo?',
'Los conectores conclusivos como "por lo tanto", "en consecuencia" o "así pues" sirven para introducir la conclusión lógica derivada de los argumentos presentados.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0064','AMN001',
'En un texto argumentativo bien estructurado, el párrafo de conclusión debe:',
'La conclusión debe retomar la tesis central y sintetizar los argumentos presentados, sin agregar información nueva que no haya sido desarrollada en el cuerpo del texto.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0065','AMN001',
'Lee el siguiente enunciado: "En Colombia, los índices de lectura son bajos en comparación con otros países de la región." Para apoyar este argumento en un texto académico, lo más apropiado es:',
'En la escritura académica, los argumentos deben respaldarse con fuentes verificables y datos estadísticos que les den validez y credibilidad.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0066','AMN001',
'¿Cuál de las siguientes opciones representa un párrafo con unidad temática?',
'La unidad temática de un párrafo exige que todas las oraciones se refieran al mismo tema central, sin desviaciones ni ideas inconexas.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0067','AMN001',
'En un ensayo académico, la coherencia textual se logra principalmente mediante:',
'La coherencia se logra cuando las ideas se ordenan de manera lógica y progresiva, y los conectores establecen relaciones claras entre los párrafos y las ideas.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0068','AMN001',
'Lee el siguiente texto: "El uso del celular en las aulas perjudica el aprendizaje. Primero, distrae a los estudiantes. Además, reduce la interacción cara a cara. Por lo tanto, se debería restringir su uso en clase." ¿Qué tipo de texto es este?',
'El texto presenta una tesis ("perjudica el aprendizaje"), argumentos que la sustentan y una conclusión, estructura propia del texto argumentativo.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0069','AMN001',
'¿Cuál de los siguientes errores afecta la cohesión de un texto?',
'La cohesión textual depende del uso correcto de conectores, pronombres y referencias para que las ideas se enlacen de manera fluida y sin ambigüedades.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0070','AMN001',
'Al escribir un resumen académico de un artículo científico, ¿qué se debe evitar?',
'El resumen académico debe ser una síntesis objetiva del contenido del texto original, sin agregar interpretaciones, opiniones ni información que no esté en el texto fuente.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0071','AMN001',
'¿Cuál es la diferencia principal entre parafrasear y plagiar un texto?',
'Parafrasear implica reescribir las ideas del autor en palabras propias, manteniendo la referencia a la fuente. El plagio consiste en presentar las ideas ajenas como propias sin citar la fuente.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0072','AMN001',
'Lee el siguiente párrafo: "La lectura desarrolla el pensamiento crítico. Sin embargo, cada vez se lee menos. Los videojuegos son muy populares entre los jóvenes. Por eso, se deben fomentar los hábitos de lectura." ¿Cuál es el principal problema de este párrafo?',
'La oración sobre los videojuegos rompe la unidad temática del párrafo, que trata sobre la lectura y el pensamiento crítico, introduciendo una idea inconexa.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0073','AMN001',
'En un informe académico, ¿cuál es la función de las citas bibliográficas?',
'Las citas bibliográficas permiten respaldar los argumentos con fuentes verificables, atribuir las ideas a sus autores originales y darle credibilidad y trazabilidad al texto.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0074','AMN001',
'¿Cuál de los siguientes textos tiene un registro formal apropiado para un contexto académico?',
'El registro académico exige un lenguaje técnico, objetivo y preciso, evitando coloquialismos, contracciones informales o subjetividades innecesarias.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0075','AMN001',
'En la estructura de un texto argumentativo, ¿cuál es la función de los contraargumentos?',
'Anticipar y rebatir los contraargumentos fortalece la tesis del autor al demostrar que ha considerado posiciones opuestas y que puede refutarlas de manera fundamentada.',
'ICFES Saber Pro - Módulo Comunicación Escrita','A'),

('CPE004','QTN0076','AMN001',
'Lee el siguiente enunciado: "Todos los estudiantes que trabajan tienen bajo rendimiento académico." Este enunciado es problemático desde el punto de vista de la escritura académica porque:',
'Las generalizaciones absolutas carecen de evidencia que las respalde y pueden ser fácilmente refutadas con contraejemplos, lo que debilita el argumento.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0077','AMN001',
'¿Cuál es la principal diferencia entre un texto expositivo y un texto argumentativo?',
'El texto expositivo presenta y explica información de manera objetiva. El argumentativo, además de presentar información, defiende una posición o tesis con el fin de persuadir.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0078','AMN001',
'Al revisar un texto propio antes de entregarlo, ¿cuál aspecto es el más importante para garantizar la claridad comunicativa?',
'La claridad comunicativa depende principalmente de que las ideas estén ordenadas de forma lógica y de que el lector pueda seguir el hilo argumental sin ambigüedades.',
'ICFES Saber Pro - Módulo Comunicación Escrita','M'),

('CPE004','QTN0079','AMN001',
'Lee el siguiente texto: "La educación virtual tiene ventajas y desventajas. Por un lado, ofrece flexibilidad horaria. Por otro lado, puede generar aislamiento social." ¿Qué estructura organizativa usa el texto?',
'El texto usa la estructura de contraste o comparación (por un lado / por otro lado), presentando aspectos positivos y negativos del mismo fenómeno.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B'),

('CPE004','QTN0080','AMN001',
'Al escribir el título de un ensayo académico, ¿qué característica debe tener principalmente?',
'Un buen título académico debe ser informativo y específico, anticipando el tema central y el enfoque del texto, sin ser ni demasiado vago ni excesivamente largo.',
'ICFES Saber Pro - Módulo Comunicación Escrita','B');

-- Opciones · CPE004
INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct) VALUES
('CPE004','QTN0061','OPT_A','Presentar el contexto histórico del tema tratado.','N'),
('CPE004','QTN0061','OPT_B','Expresar la posición central del autor que será argumentada en el texto.','Y'),
('CPE004','QTN0061','OPT_C','Resumir las fuentes bibliográficas consultadas.','N'),
('CPE004','QTN0061','OPT_D','Describir la metodología utilizada en la investigación.','N'),

('CPE004','QTN0062','OPT_A','El cambio climático es uno de los mayores retos de nuestra época.','N'),
('CPE004','QTN0062','OPT_B','Diversos estudios señalan sus causas antropogénicas.','N'),
('CPE004','QTN0062','OPT_C','Las políticas actuales son insuficientes para detener el cambio climático.','Y'),
('CPE004','QTN0062','OPT_D','El cambio climático tiene causas naturales y artificiales.','N'),

('CPE004','QTN0063','OPT_A','Sin embargo','N'),
('CPE004','QTN0063','OPT_B','Además','N'),
('CPE004','QTN0063','OPT_C','Por lo tanto','Y'),
('CPE004','QTN0063','OPT_D','Por ejemplo','N'),

('CPE004','QTN0064','OPT_A','Presentar nuevos argumentos que refuercen la tesis.','N'),
('CPE004','QTN0064','OPT_B','Retomar la tesis y sintetizar los argumentos desarrollados, sin agregar información nueva.','Y'),
('CPE004','QTN0064','OPT_C','Citar nuevas fuentes bibliográficas para respaldar la posición del autor.','N'),
('CPE004','QTN0064','OPT_D','Plantear nuevas preguntas de investigación sobre el tema.','N'),

('CPE004','QTN0065','OPT_A','Expresar la opinión personal del autor con convicción y claridad.','N'),
('CPE004','QTN0065','OPT_B','Citar datos estadísticos de fuentes verificables que respalden la afirmación.','Y'),
('CPE004','QTN0065','OPT_C','Incluir testimonios de personas cercanas que confirmen el problema.','N'),
('CPE004','QTN0065','OPT_D','Comparar la situación con la de países desarrollados sin una fuente específica.','N'),

('CPE004','QTN0066','OPT_A','Un párrafo que habla de la contaminación, luego de la música y finalmente del deporte.','N'),
('CPE004','QTN0066','OPT_B','Un párrafo que desarrolla únicamente las causas de la deserción escolar en Colombia.','Y'),
('CPE004','QTN0066','OPT_C','Un párrafo que menciona la pobreza, el desempleo y los beneficios del turismo.','N'),
('CPE004','QTN0066','OPT_D','Un párrafo que aborda el calentamiento global y las tradiciones culturales indígenas.','N'),

('CPE004','QTN0067','OPT_A','Usar palabras de difícil comprensión para demostrar dominio del tema.','N'),
('CPE004','QTN0067','OPT_B','Ordenar las ideas de manera lógica y usar conectores que relacionen las partes del texto.','Y'),
('CPE004','QTN0067','OPT_C','Repetir la tesis en cada párrafo para que el lector no la olvide.','N'),
('CPE004','QTN0067','OPT_D','Incluir muchos ejemplos aunque no estén directamente relacionados con la tesis.','N'),

('CPE004','QTN0068','OPT_A','Texto narrativo.','N'),
('CPE004','QTN0068','OPT_B','Texto descriptivo.','N'),
('CPE004','QTN0068','OPT_C','Texto argumentativo.','Y'),
('CPE004','QTN0068','OPT_D','Texto expositivo.','N'),

('CPE004','QTN0069','OPT_A','Usar sinónimos para evitar la repetición innecesaria de palabras.','N'),
('CPE004','QTN0069','OPT_B','Utilizar conectores que no corresponden a la relación lógica entre las ideas.','Y'),
('CPE004','QTN0069','OPT_C','Citar fuentes secundarias para respaldar los argumentos principales.','N'),
('CPE004','QTN0069','OPT_D','Variar la extensión de los párrafos para mantener el interés del lector.','N'),

('CPE004','QTN0070','OPT_A','Usar palabras clave del texto original.','N'),
('CPE004','QTN0070','OPT_B','Mencionar el título y el autor del texto resumido.','N'),
('CPE004','QTN0070','OPT_C','Incluir opiniones personales o interpretaciones no presentes en el texto original.','Y'),
('CPE004','QTN0070','OPT_D','Reducir la extensión del texto original.','N'),

('CPE004','QTN0071','OPT_A','Parafrasear es copiar frases del texto original con pequeños cambios de palabras.','N'),
('CPE004','QTN0071','OPT_B','Parafrasear es reescribir las ideas en palabras propias citando la fuente; plagiar es presentar ideas ajenas como propias.','Y'),
('CPE004','QTN0071','OPT_C','No hay diferencia si se menciona el nombre del autor al final del texto.','N'),
('CPE004','QTN0071','OPT_D','El plagio solo ocurre cuando se copia textualmente más de un párrafo completo.','N'),

('CPE004','QTN0072','OPT_A','Usa demasiados conectores adversativos.','N'),
('CPE004','QTN0072','OPT_B','La oración sobre los videojuegos rompe la unidad temática del párrafo.','Y'),
('CPE004','QTN0072','OPT_C','La tesis no está claramente formulada al inicio del párrafo.','N'),
('CPE004','QTN0072','OPT_D','La conclusión no retoma adecuadamente la idea central.','N'),

('CPE004','QTN0073','OPT_A','Aumentar la extensión del texto para demostrar mayor conocimiento.','N'),
('CPE004','QTN0073','OPT_B','Demostrar que el autor leyó muchos libros sobre el tema.','N'),
('CPE004','QTN0073','OPT_C','Respaldar argumentos con fuentes verificables y atribuir ideas a sus autores originales.','Y'),
('CPE004','QTN0073','OPT_D','Cumplir con los requisitos formales exigidos por el docente.','N'),

('CPE004','QTN0074','OPT_A','"Oye, la tecnología en las aulas está buenísima para aprender mejor."','N'),
('CPE004','QTN0074','OPT_B','"La integración de tecnologías digitales en el aula favorece el desarrollo de competencias del siglo XXI."','Y'),
('CPE004','QTN0074','OPT_C','"Igual, al fin y al cabo, todo depende del profe y de las ganas del estudiante."','N'),
('CPE004','QTN0074','OPT_D','"La tecnología en clase es súper importante y todo el mundo debería usarla."','N'),

('CPE004','QTN0075','OPT_A','Debilitan la tesis al mostrar que existen opiniones en contra.','N'),
('CPE004','QTN0075','OPT_B','Son errores argumentativos que deben evitarse en un buen texto.','N'),
('CPE004','QTN0075','OPT_C','Fortalecen la tesis al demostrar que el autor consideró y rebatió posiciones opuestas.','Y'),
('CPE004','QTN0075','OPT_D','Son útiles solo en textos de opinión, no en ensayos académicos.','N'),

('CPE004','QTN0076','OPT_A','Porque no incluye una cita bibliográfica que lo respalde.','N'),
('CPE004','QTN0076','OPT_B','Porque hace una generalización absoluta sin evidencia que la sustente.','Y'),
('CPE004','QTN0076','OPT_C','Porque usa un lenguaje demasiado coloquial para un texto académico.','N'),
('CPE004','QTN0076','OPT_D','Porque la idea es demasiado obvia y no aporta nada nuevo al debate.','N'),

('CPE004','QTN0077','OPT_A','El expositivo usa imágenes y el argumentativo usa solo texto.','N'),
('CPE004','QTN0077','OPT_B','El expositivo informa objetivamente; el argumentativo defiende una posición para persuadir.','Y'),
('CPE004','QTN0077','OPT_C','El expositivo es más largo y formal que el argumentativo.','N'),
('CPE004','QTN0077','OPT_D','El argumentativo solo se usa en contextos legales y jurídicos.','N'),

('CPE004','QTN0078','OPT_A','Que el texto tenga exactamente la extensión requerida por el docente.','N'),
('CPE004','QTN0078','OPT_B','Que las ideas estén ordenadas lógicamente y el lector pueda seguir el hilo argumentativo.','Y'),
('CPE004','QTN0078','OPT_C','Que no haya ningún error ortográfico ni de puntuación.','N'),
('CPE004','QTN0078','OPT_D','Que todas las fuentes estén en formato APA actualizado.','N'),

('CPE004','QTN0079','OPT_A','Estructura problema-solución.','N'),
('CPE004','QTN0079','OPT_B','Estructura causa-efecto.','N'),
('CPE004','QTN0079','OPT_C','Estructura de contraste o comparación.','Y'),
('CPE004','QTN0079','OPT_D','Estructura cronológica.','N'),

('CPE004','QTN0080','OPT_A','Ser llamativo y creativo para atraer la atención del lector.','N'),
('CPE004','QTN0080','OPT_B','Ser informativo y específico, anticipando el tema central y el enfoque del texto.','Y'),
('CPE004','QTN0080','OPT_C','Ser breve, idealmente de una sola palabra o concepto.','N'),
('CPE004','QTN0080','OPT_D','Incluir el nombre del autor y la institución a la que pertenece.','N');


-- ───────────────────────────────────────────────────────────────────
--  CPE005 · Inglés
-- ───────────────────────────────────────────────────────────────────
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, explanation, source, difficulty_level) VALUES

('CPE005','QTN0081','AMN001',
'Read the following sentence: "She has been working at the company for five years." What tense is used?',
'The structure "has been + verb-ing" corresponds to the Present Perfect Continuous, used to describe an action that started in the past and continues in the present.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0082','AMN001',
'Choose the correct option to complete the sentence: "If it _______ tomorrow, we will cancel the trip."',
'In a first-conditional sentence (real possibility), the if-clause uses the Simple Present: "If it rains tomorrow, we will cancel the trip."',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0083','AMN001',
'Read the text: "Despite the heavy rain, the students attended the lecture." The word "despite" indicates:',
'"Despite" is a preposition of contrast that introduces a concessive idea: the heavy rain did not prevent the students from attending.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0084','AMN001',
'Choose the sentence with the correct use of the passive voice:',
'The passive voice is formed with the verb "to be" + past participle. "The report was written by the manager" is the correct passive construction.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0085','AMN001',
'Read the following paragraph: "Deforestation is one of the main causes of climate change. Every year, millions of hectares of forest are destroyed. This has a devastating impact on biodiversity." What is the main idea of the paragraph?',
'The topic sentence establishes deforestation as the central subject, and the rest of the paragraph develops its consequences.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0086','AMN001',
'Which of the following sentences uses the correct form of a modal verb to express obligation?',
'The modal verb "must" expresses strong obligation or necessity. "You must wear a helmet" is the correct form.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0087','AMN001',
'Read the following text: "Although social media can be a useful tool for communication, it can also contribute to anxiety and depression among teenagers." The author suggests that social media is:',
'The word "although" signals a concessive contrast: social media has both positive (communication) and negative (mental health) effects.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0088','AMN001',
'Choose the correct word to complete the sentence: "The researcher found that stress _______ negatively affect academic performance."',
'"Can" is the appropriate modal verb here to express general possibility or capacity based on research findings.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0089','AMN001',
'Which of the following sentences is grammatically correct?',
'Subject-verb agreement requires using "is" with a singular subject. "Each student is responsible for their own work" is the correct sentence.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0090','AMN001',
'Read the following sentence: "The new policy will have been implemented by the end of the year." What tense is used?',
'The structure "will have been + past participle" is the Future Perfect Passive, indicating an action that will be completed before a future point in time.',
'ICFES Saber Pro - Módulo Inglés','A'),

('CPE005','QTN0091','AMN001',
'Read the text: "Renewable energy sources such as solar and wind power are becoming increasingly important as fossil fuel reserves decline." What does "decline" mean in this context?',
'In this context, "decline" means to decrease or become smaller in quantity, referring to the reduction of fossil fuel reserves.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0092','AMN001',
'Choose the correct relative pronoun: "The scientist _______ discovered penicillin was Alexander Fleming."',
'"Who" is the correct relative pronoun to refer to people as the antecedent of the relative clause.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0093','AMN001',
'Read the following advertisement: "Buy one, get one free! Limited time offer. Do not miss out!" The main purpose of this text is to:',
'The text uses promotional language ("limited time", "do not miss out") typical of advertising, with the clear purpose of persuading consumers to buy.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0094','AMN001',
'Which sentence correctly uses a gerund as the subject?',
'A gerund (verb + -ing) can function as the subject of a sentence. "Swimming regularly improves cardiovascular health" is the correct example.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0095','AMN001',
'Read the email opening: "I am writing to inquire about the availability of the position advertised on your website." This sentence indicates that the email is:',
'The formal register and the phrase "I am writing to inquire" are typical of a formal job inquiry or application letter.',
'ICFES Saber Pro - Módulo Inglés','B'),

('CPE005','QTN0096','AMN001',
'Choose the correct option: "By the time she arrived, the meeting _______ already started."',
'The Past Perfect "had already started" is used to indicate an action that was completed before another past action.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0097','AMN001',
'Read the text: "The government should invest more in public transportation to reduce traffic congestion and air pollution." The author is making a:',
'The use of "should" and the justification provided ("to reduce...") characterize this as a recommendation or proposal.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0098','AMN001',
'Which of the following correctly uses a reported-speech structure?',
'In reported speech, the verb tense shifts back (backshifting). "She said that she was tired" correctly reports "I am tired" in indirect speech.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0099','AMN001',
'Read the following text: "While some argue that technology dehumanizes society, others believe it brings people closer together." What is the communicative purpose of this sentence?',
'The structure "while some argue... others believe..." presents two contrasting viewpoints without taking sides, which is the structure of a balanced argument.',
'ICFES Saber Pro - Módulo Inglés','M'),

('CPE005','QTN0100','AMN001',
'Choose the correct connector to complete the sentence: "The experiment failed; _______, the team decided to start over."',
'"Therefore" is a logical-consequence connector (similar to "thus" or "as a result"), appropriate when the second clause is the logical result of the first.',
'ICFES Saber Pro - Módulo Inglés','M');

-- Opciones · CPE005
INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct) VALUES
('CPE005','QTN0081','OPT_A','Simple Past','N'),
('CPE005','QTN0081','OPT_B','Present Perfect Continuous','Y'),
('CPE005','QTN0081','OPT_C','Past Continuous','N'),
('CPE005','QTN0081','OPT_D','Present Perfect Simple','N'),

('CPE005','QTN0082','OPT_A','rained','N'),
('CPE005','QTN0082','OPT_B','would rain','N'),
('CPE005','QTN0082','OPT_C','rains','Y'),
('CPE005','QTN0082','OPT_D','will rain','N'),

('CPE005','QTN0083','OPT_A','A cause-and-effect relationship.','N'),
('CPE005','QTN0083','OPT_B','A contrast between two ideas.','Y'),
('CPE005','QTN0083','OPT_C','A condition for something to happen.','N'),
('CPE005','QTN0083','OPT_D','A sequence of events in time.','N'),

('CPE005','QTN0084','OPT_A','The manager written the report.','N'),
('CPE005','QTN0084','OPT_B','The report was written by the manager.','Y'),
('CPE005','QTN0084','OPT_C','The report has write by the manager.','N'),
('CPE005','QTN0084','OPT_D','The manager was written the report.','N'),

('CPE005','QTN0085','OPT_A','The impact of climate change on global temperatures.','N'),
('CPE005','QTN0085','OPT_B','Deforestation is a major cause of climate change and threatens biodiversity.','Y'),
('CPE005','QTN0085','OPT_C','Biodiversity loss is the most serious environmental problem today.','N'),
('CPE005','QTN0085','OPT_D','Forests are essential for human survival and economic development.','N'),

('CPE005','QTN0086','OPT_A','You should to wear a helmet.','N'),
('CPE005','QTN0086','OPT_B','You must wear a helmet.','Y'),
('CPE005','QTN0086','OPT_C','You must to wear a helmet.','N'),
('CPE005','QTN0086','OPT_D','You musts wear a helmet.','N'),

('CPE005','QTN0087','OPT_A','Only beneficial for teenagers.','N'),
('CPE005','QTN0087','OPT_B','Both useful and potentially harmful.','Y'),
('CPE005','QTN0087','OPT_C','Primarily a source of anxiety and depression.','N'),
('CPE005','QTN0087','OPT_D','An ineffective communication tool.','N'),

('CPE005','QTN0088','OPT_A','must','N'),
('CPE005','QTN0088','OPT_B','should','N'),
('CPE005','QTN0088','OPT_C','can','Y'),
('CPE005','QTN0088','OPT_D','have to','N'),

('CPE005','QTN0089','OPT_A','Each student are responsible for their own work.','N'),
('CPE005','QTN0089','OPT_B','Each student is responsible for their own work.','Y'),
('CPE005','QTN0089','OPT_C','Each students is responsible for their own work.','N'),
('CPE005','QTN0089','OPT_D','Each student be responsible for their own work.','N'),

('CPE005','QTN0090','OPT_A','Future Simple Passive','N'),
('CPE005','QTN0090','OPT_B','Future Continuous','N'),
('CPE005','QTN0090','OPT_C','Future Perfect Passive','Y'),
('CPE005','QTN0090','OPT_D','Present Perfect Passive','N'),

('CPE005','QTN0091','OPT_A','Increase','N'),
('CPE005','QTN0091','OPT_B','Remain stable','N'),
('CPE005','QTN0091','OPT_C','Decrease','Y'),
('CPE005','QTN0091','OPT_D','Improve','N'),

('CPE005','QTN0092','OPT_A','which','N'),
('CPE005','QTN0092','OPT_B','that','N'),
('CPE005','QTN0092','OPT_C','who','Y'),
('CPE005','QTN0092','OPT_D','whose','N'),

('CPE005','QTN0093','OPT_A','To inform consumers about product safety regulations.','N'),
('CPE005','QTN0093','OPT_B','To persuade consumers to make a purchase.','Y'),
('CPE005','QTN0093','OPT_C','To warn consumers about a limited product supply.','N'),
('CPE005','QTN0093','OPT_D','To describe the features of a new product.','N'),

('CPE005','QTN0094','OPT_A','To swim regularly is improving cardiovascular health.','N'),
('CPE005','QTN0094','OPT_B','Swimming regularly improves cardiovascular health.','Y'),
('CPE005','QTN0094','OPT_C','Swim regularly improve cardiovascular health.','N'),
('CPE005','QTN0094','OPT_D','Regularly swimming it improves cardiovascular health.','N'),

('CPE005','QTN0095','OPT_A','A complaint letter to a company.','N'),
('CPE005','QTN0095','OPT_B','A formal job application or inquiry letter.','Y'),
('CPE005','QTN0095','OPT_C','An informal message to a colleague.','N'),
('CPE005','QTN0095','OPT_D','A thank-you note for an interview.','N'),

('CPE005','QTN0096','OPT_A','already started','N'),
('CPE005','QTN0096','OPT_B','has already started','N'),
('CPE005','QTN0096','OPT_C','had already started','Y'),
('CPE005','QTN0096','OPT_D','was already starting','N'),

('CPE005','QTN0097','OPT_A','A factual description of transportation systems.','N'),
('CPE005','QTN0097','OPT_B','A recommendation or proposal to the government.','Y'),
('CPE005','QTN0097','OPT_C','A criticism of the current government''s performance.','N'),
('CPE005','QTN0097','OPT_D','A prediction about future transportation trends.','N'),

('CPE005','QTN0098','OPT_A','She said that she is tired.','N'),
('CPE005','QTN0098','OPT_B','She said that she was tired.','Y'),
('CPE005','QTN0098','OPT_C','She said that she were tired.','N'),
('CPE005','QTN0098','OPT_D','She said that she has been tired.','N'),

('CPE005','QTN0099','OPT_A','To argue that technology dehumanizes society.','N'),
('CPE005','QTN0099','OPT_B','To present two contrasting perspectives on the role of technology.','Y'),
('CPE005','QTN0099','OPT_C','To defend the idea that technology brings people closer together.','N'),
('CPE005','QTN0099','OPT_D','To describe the negative effects of technology on human relationships.','N'),

('CPE005','QTN0100','OPT_A','however','N'),
('CPE005','QTN0100','OPT_B','although','N'),
('CPE005','QTN0100','OPT_C','therefore','Y'),
('CPE005','QTN0100','OPT_D','despite','N');
