Passaggi necessari

- configurare il provider Azure
- riferimento (o creazione) del resource group
  - in generale conviene crearlo e poi fare un riferimento?
    - es.: un KV lo creo e poi lo riferisco, conviene creare a parte RG e KV
    - KV lo fai TF e poi le value le metti a mano
- riferimento (o creazione) delle risorse di rete:
  - endpoint privato o pubblico?
  - creo o punto una risorsa già esistente?
- creazione del private endpoint
  - mi permette di collegare la mia risorsa con un ip privato attraverso la vnet
- creazione della private dns zone
  - mi permette la risoluzione del mio endpoint privato?
- creazione del link tra private dns zone e la virtual network
  - ho bisogno di un collegamento tra la mia dns zone e la vn?
- creazione del private dns zone group

- Risorsa -> private endpoint

- VNet <- solitamente risorse comune

- Uso locals per passare i valori dal main al modulo che richiamo!
- Posso usare le variables per valorizzare i miei locals

- Nomenclatura risorsa: #[io]-[d]-[itn]-redis-01: io-d-itn-redis-test-01
