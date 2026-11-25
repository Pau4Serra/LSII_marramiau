import './NoSearchResults.css';

export interface NoSearchResultsProps {
  query?: string;
}

/**
 * Estat buit que es mostra quan una cerca no retorna cap vídeo.
 * Inclou una il·lustració, el terme cercat (si n'hi ha) i un consell per tornar-ho a provar.
 */
export const NoSearchResults = ({ query }: NoSearchResultsProps) => {
  const trimmedQuery = query?.trim();

  return (
    <section className="no-search-results" role="status" aria-live="polite">
      <svg
        className="no-search-results__icon"
        viewBox="0 0 120 120"
        aria-hidden="true"
        focusable="false"
        data-testid="no-search-results-icon"
      >
        {/* Fons circular */}
        <circle cx="60" cy="60" r="56" className="no-search-results__icon-bg" />
        {/* Lupa */}
        <circle cx="52" cy="52" r="22" className="no-search-results__icon-stroke" />
        <line x1="68" y1="68" x2="88" y2="88" className="no-search-results__icon-stroke" />
        {/* Creu dins la lupa: cap resultat */}
        <line x1="44" y1="44" x2="60" y2="60" className="no-search-results__icon-accent" />
        <line x1="60" y1="44" x2="44" y2="60" className="no-search-results__icon-accent" />
      </svg>

      <h2 className="no-search-results__title">No videos found</h2>
      {trimmedQuery && (
        <p className="no-search-results__query">
          We couldn't find any results for <strong>"{trimmedQuery}"</strong>
        </p>
      )}
      <p className="no-search-results__hint">Try searching again with different words or check your spelling.</p>
    </section>
  );
};

export default NoSearchResults;
