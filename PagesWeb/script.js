
//Recupération de chaque élément de la base de donnée
async function recupererEvenements() {
    const response = await fetch('http://127.0.0.1:5500/ords/hr2/evenement/');
    const evenements = await response.json();
    return evenements.items;
}

async function recupererOrganisateurs() {
    const response = await fetch('http://127.0.0.1:5500/ords/hr2/organisateur/');
    const organisateurs = await response.json();
    return organisateurs.items;
}

// Fonction pour créer les éléments html a partir de la base de donnée
function creerElementEvenement(evenement, organisateurs) {
    const evenementElement = document.createElement('div');
    evenementElement.className = 'event';

    const evenementImage = document.createElement('img');

    const nomImage = evenement.nom_evenement.toLowerCase().replace(/ /g, '_') + '.png';
    evenementImage.src = `images/${nomImage}`;
    evenementImage.onclick = () => {
        window.location.href = `event.html?id=${evenement.id_evenement}`;
    };
    evenementElement.appendChild(evenementImage);

    const evenementDetails = document.createElement('div');
    evenementDetails.className = 'event-details';

    const nomEvenement = document.createElement('h3');
    nomEvenement.textContent = evenement.nom_evenement;
    nomEvenement.onclick = () => {
        window.location.href = `event.html?id=${evenement.id_evenement}`;
    };
    evenementDetails.appendChild(nomEvenement);

    const organisateur = organisateurs.find(o => o.id_organisateur === evenement.id_organisateur);
    if (organisateur) {
        const nomOrganisateur = document.createElement('p');
        nomOrganisateur.textContent = `Organisé par: ${organisateur.nom_organisateur}`;
        nomOrganisateur.onclick = () => {
            window.location.href = `organisateur.html?id=${organisateur.id_organisateur}`;
        };
        evenementDetails.appendChild(nomOrganisateur);
    }

    evenementElement.appendChild(evenementDetails);
    return evenementElement;
}

// Fonction pour afficher les événements sur la page
async function afficherEvenements() {
    const listeEvenements = document.getElementById('ListeEvenements');
    const evenements = await recupererEvenements();
    const organisateurs = await recupererOrganisateurs();

    evenements.forEach(evenement => {
        const evenementElement = creerElementEvenement(evenement, organisateurs);
        listeEvenements.appendChild(evenementElement);
    });
}

window.onload = afficherEvenements;

async function recupererDetailsEvenement(idEvenement) {
    const response = await fetch(`'http://127.0.0.1:5500/ords/hr2/organisateur/'${idEvenement}`);
    const evenement = await response.json();
    return evenement;
}

// Fonction pour afficher les détails de l'événement sur la page
async function afficherDetailsEvenement(idEvenement) {
    const evenement = await recupererDetailsEvenement(idEvenement);
    const detailsEvenementElement = document.getElementById('DetailsEvenement');

// Création des éléments HTML pour afficher les détails de l'événement
    const nomEvenement = document.createElement('h2');
    nomEvenement.textContent = evenement.nom_evenement;
    detailsEvenementElement.appendChild(nomEvenement);

    const descriptionEvenement = document.createElement('p');
    descriptionEvenement.textContent = evenement.description;
    detailsEvenementElement.appendChild(descriptionEvenement);

    const dateEvenement = document.createElement('p');
    dateEvenement.textContent = `Date: ${evenement.date}`;
    detailsEvenementElement.appendChild(dateEvenement);

    const heureEvenement = document.createElement('p');
    heureEvenement.textContent = `Heure: ${evenement.heure}`;
    detailsEvenementElement.appendChild(heureEvenement);

    const lieuEvenement = document.createElement('p');
    lieuEvenement.textContent = `Lieu: ${evenement.lieu}`;
    detailsEvenementElement.appendChild(lieuEvenement);

    
}

// Appel de la fonction afficherDetailsEvenement lors du chargement de la page
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const idEvenement = urlParams.get('id');
    afficherDetailsEvenement(idEvenement);
};