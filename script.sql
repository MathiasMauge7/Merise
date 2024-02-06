CREATE TABLE Utilisateur (
    utilisateurId INT PRIMARY KEY,
    email VARCHAR(255),
    mot_de_passe VARCHAR(255)
);

CREATE TABLE Etudiant (
    etudiantId INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    sessionId INT,
    FOREIGN KEY (etudiantId) REFERENCES Utilisateur(utilisateurId),
    FOREIGN KEY (sessionId) REFERENCES Session(sessionId)
);

CREATE TABLE Formateur (
    formateurId INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    FOREIGN KEY (formateurId) REFERENCES Utilisateur(utilisateurId)
);

CREATE TABLE Session (
    sessionId INT PRIMARY KEY,
    nom_session VARCHAR(255),
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Cours (
    coursId INT PRIMARY KEY,
    nom_cours VARCHAR(255),
    sessionId INT,
    FOREIGN KEY (sessionId) REFERENCES Session(sessionId)
);

CREATE TABLE Evaluation (
    evaluationId INT PRIMARY KEY,
    type_evaluation VARCHAR(255),
    coursId INT,
    formateurId INT,
    FOREIGN KEY (coursId) REFERENCES Cours(coursId),
    FOREIGN KEY (formateurId) REFERENCES Formateur(formateurId)
);

CREATE TABLE Note (
    noteId INT PRIMARY KEY,
    note DECIMAL(5, 2),
    evaluationId INT,
    etudiantId INT,
    FOREIGN KEY (evaluationId) REFERENCES Evaluation(evaluationId),
    FOREIGN KEY (etudiantId) REFERENCES Etudiant(etudiantId)
);
