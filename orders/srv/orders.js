module.exports = (srv) => {

    // 1. estrai le entity
    const { Orders, OrderItems } = srv.entities;
    // 2. recupera user
      srv.on('createdAt', req => {
    return `Operation executed by user: ${req.user.id}`;
  });

    // 3. registra l’action
    srv.on('calculateTotal', async (req) => {

        // 4. leggi orderID
        const orderID = req.data.orderID;

        // 5. leggi gli items dal DB
        const items = await SELECT.from(OrderItems).where({ order_ID: orderID });

        // 6. loop per sommare
        let total = 0;
        for (const item of items) {
            total += item.quantity * item.price;
        }

        // 7cds watch. ritorna il totale
        return total;

    });
};
