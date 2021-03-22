package swaup.edu.poc.currencyexchange.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import swaup.edu.poc.currencyexchange.entity.ExchangeValue;

public interface ExchangeValueRepository extends JpaRepository<ExchangeValue, Long> {
	ExchangeValue findByFromAndTo(String from, String to);
}
