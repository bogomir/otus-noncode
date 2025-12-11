CREATE TABLE orders (
    order_id        BIGSERIAL PRIMARY KEY,
    user_id         BIGINT NOT NULL,
    shop_id         BIGINT NOT NULL,
    total_amount    NUMERIC(10,2) NOT NULL,
    status          VARCHAR(50) NOT NULL, 
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    -- Внешние ключи
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id) REFERENCES users(user_id),

    CONSTRAINT fk_orders_shop
        FOREIGN KEY (shop_id) REFERENCES shops(shop_id)
);

CREATE TABLE deliveries (
    delivery_id     BIGSERIAL PRIMARY KEY,
    order_id        BIGINT NOT NULL,
    courier_id      BIGINT NOT NULL,
    status          VARCHAR(50) NOT NULL,
    eta             TIMESTAMP,
    delivered_at    TIMESTAMP,
    address         TEXT NOT NULL,
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW(),

    -- Внешние ключи
    CONSTRAINT fk_deliveries_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),

    CONSTRAINT fk_deliveries_courier
        FOREIGN KEY (courier_id) REFERENCES couriers(courier_id)
);

